import 'dart:convert';
import 'package:flutter_new_architectua/utils/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  final String baseUrl;
  final FlutterSecureStorage storage;

  ApiClient({required this.baseUrl, required this.storage});

  Future<http.Response> sendRequest(String endpoint, String method,
      {Map<String, String>? headers, dynamic body}) async {
    String? accessToken = await getAccessToken();
    headers = headers ?? {};

    if (accessToken != null) {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    var response = http.Request(method, Uri.parse('$baseUrl/$endpoint'))
      ..headers.addAll(headers)
      ..body = jsonEncode(body);

    var streamedResponse = await response.send();
    var result = await http.Response.fromStream(streamedResponse);

    if (result.statusCode == 401) {
      bool refreshed = await refreshAccessToken();

      if (refreshed) {
        accessToken = await getAccessToken();
        headers['Authorization'] = 'Bearer $accessToken';
        response = http.Request(method, Uri.parse('$baseUrl/$endpoint'))
          ..headers.addAll(headers)
          ..body = jsonEncode(body);

        streamedResponse = await response.send();
        result = await http.Response.fromStream(streamedResponse);
      } else {
        await deleteTokens();
      }
    }

    return result;
  }

  Future<bool> refreshAccessToken() async {
    String? refreshToken = await getRefreshToken();

    if (refreshToken != null) {
      var response = await http.post(
        Uri.parse('$baseUrl/auth/refresh'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'refreshToken': refreshToken}),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        String newAccessToken = data['accessToken'];
        await storage.write(key: 'access_token', value: newAccessToken);
        return true;
      }
    }

    return false;
  }
}

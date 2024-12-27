import 'dart:convert';
import 'package:flutter_new_architectua/core/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.gr.dart';
import 'package:flutter_new_architectua/core/services/overlay_service.dart';
import 'package:flutter_new_architectua/core/storage/account_secure_storage.dart';
import 'package:flutter_new_architectua/model/auth_model.dart';
import 'package:flutter_new_architectua/core/storage/token_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  final String baseUrl;
  final FlutterSecureStorage storage;

  ApiClient({required this.baseUrl, required this.storage});

  Future<http.Response> sendRequest(String endpoint, String method,
      {Map<String, String>? headers, dynamic body}) async {
    late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();
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
        await deleteAccount();
        OverlayService().showAlert(
            title: 'Session Expired',
            message: 'Please login again',
            onConfirm: () {
              navigator.replace(AuthRoute(title: 'Login'));
            });
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
        final result = AuthModel.fromJson(jsonDecode(response.body));
        String newAccessToken = '';
        if (result.data != null && result.data!.accessToken != null) {
          newAccessToken = result.data!.accessToken!;
        }
        await storage.write(key: 'access_token', value: newAccessToken);
        return true;
      }
    }

    return false;
  }

  Future<http.Response> sendRequestWithFile(
      String endpoint, String method, String path,
      {Map<String, String>? headers}) async {
    headers = headers ?? {};

    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/$endpoint'))
      ..headers.addAll(headers);

    request.files.add(await http.MultipartFile.fromPath('image', path));
    var streamedResponse = await request.send();
    var result = await http.Response.fromStream(streamedResponse);

    return result;
  }
}

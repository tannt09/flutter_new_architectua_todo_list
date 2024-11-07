import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_new_architectua/api/config/custom_api_client.dart';
import 'package:flutter_new_architectua/model/auth_model.dart';
import 'package:flutter_new_architectua/utils/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

final _logger = Logger('ProductsApi');

Future<AuthModel> registerUser(
    String username, String password, String email) async {
  // Configure logger to print to console
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    log('${record.level.name}: ${record.time}: ${record.message}');
  });

  await dotenv.load();

  final url = Uri.parse('${dotenv.env['BASE_URL']}/customers/register');
  final data = {'username': username, 'password': password, "email": email};

  try {
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));
    final Map<String, dynamic> parsed = jsonDecode(response.body);
    final AuthModel result = AuthModel.fromJson(parsed);
    _logger.severe('Response registering user: ${result.message}');
    return result;
  } catch (e) {
    _logger.severe('Error registering user: $e');
    final AuthModel result = AuthModel(code: 404, message: "$e", data: null);
    return result;
  }
}

Future<AuthModel> loginUser(String username, String password) async {
  // Configure logger to print to console
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    log('${record.level.name}: ${record.time}: ${record.message}');
  });

  await dotenv.load();

  final data = {'username': username, 'password': password};

  ApiClient apiClient =
      ApiClient(baseUrl: '${dotenv.env['BASE_URL']}', storage: storage);

  try {
    final response = await apiClient.sendRequest('customers/login', 'POST',
        body: data, headers: {'Content-Type': 'application/json'});
    final Map<String, dynamic> parsed = jsonDecode(response.body);
    final AuthModel result = AuthModel.fromJson(parsed);

    _logger.severe('Response login: ${result.message}');
    return result;
  } catch (e) {
    _logger.severe('Error login: $e');
    final AuthModel result = AuthModel(code: 404, message: "$e", data: null);
    return result;
  }
}

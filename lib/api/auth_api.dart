import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_new_architectua/model/auth_model.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

final _logger = Logger('ProductsApi');

Future<AuthModel> registerUser(
    String username, String password, String email) async {
  final url = Uri.parse('${dotenv.env['BASE_URL']}/auth/register');
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
  final url = Uri.parse('${dotenv.env['BASE_URL']}/auth/login');
  final data = {'username': username, 'password': password};

  try {
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));
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

Future<AuthModel> googleLogin(String idToken) async {
  final url = Uri.parse('${dotenv.env['BASE_URL']}/auth/googleLogin');
  final data = {'id_token': idToken};

  try {
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));
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

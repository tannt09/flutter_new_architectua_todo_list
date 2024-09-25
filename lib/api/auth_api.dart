import 'dart:convert';
import 'dart:developer';

import 'package:flutter_new_architectua/model/login_model.dart';
import 'package:flutter_new_architectua/model/register_model.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

final _logger = Logger('ProductsApi');

Future<String?> registerUser(
    String username, String password, String email) async {
  // Configure logger to print to console
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    log('${record.level.name}: ${record.time}: ${record.message}');
  });

  final url = Uri.parse('http://192.168.1.9:3000/customers/register');
  final data = {'username': username, 'password': password, "email": email};

  try {
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));
    final Map<String, dynamic> parsed = jsonDecode(response.body);
    final RegisterModel result = RegisterModel.fromJson(parsed);
    _logger.severe('Response registering user: ${result.error}');
    return response.statusCode == 200 ? result.message : result.error;
  } catch (e) {
    _logger.severe('Error registering user: $e');
    return "$e";
  }
}

Future<LoginModel?> loginUser(String username, String password) async {
  // Configure logger to print to console
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    log('${record.level.name}: ${record.time}: ${record.message}');
  });

  final url = Uri.parse('http://192.168.1.9:3000/customers/login');
  final data = {'username': username, 'password': password};

  try {
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));
    final Map<String, dynamic> parsed = jsonDecode(response.body);
    final LoginModel result = LoginModel.fromJson(parsed);
    _logger.severe('Response login: ${result.error}');
    return result;
  } catch (e) {
    _logger.severe('Error login: $e');
    final LoginModel result = LoginModel.fromJson(
        {"code": 404, "message": "", "data": null, "error": e});
    return result;
  }
}
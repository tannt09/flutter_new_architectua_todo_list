import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

final _logger = Logger('ProductsApi');

Future<String> registerUser(
    String username, String password, String email) async {
  // Configure logger to print to console
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    log('${record.level.name}: ${record.time}: ${record.message}');
  });

  final url = Uri.parse('http://192.168.1.5:3000/customers/register');
  final data = {'username': username, 'password': password, "email": email};

  try {
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));
    return response.statusCode == 200 ? 'Register Success' : 'Register Failure';
  } catch (e) {
    _logger.severe('Error registering user: $e');
    return 'Register Error';
  }
}

import 'package:flutter_new_architectua/core/storage/token_secure_storage.dart';

Future<void> saveAccount(String username, String password) async {
  await storage.write(key: 'username', value: username);
  await storage.write(key: 'password', value: password);
}

Future<List<String?>> getAccount() async {
  final username = await storage.read(key: 'username');
  final password = await storage.read(key: 'password');
  return [username, password];
}

Future<void> deleteAccount() async {
  await storage.delete(key: 'username');
  await storage.delete(key: 'password');
}

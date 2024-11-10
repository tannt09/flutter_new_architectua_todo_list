import 'package:flutter_new_architectua/core/storage/token_secure_storage.dart';

Future<void> saveAccount(String username, String password) async {
  await storage.write(key: 'username', value: username);
  await storage.write(key: 'password', value: password);
}

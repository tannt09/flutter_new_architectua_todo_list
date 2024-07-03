import 'package:flutter_new_architectua/main.dart';
import 'package:sqflite/sql.dart';

class User {
  final int id;
  final String name;
  final int age;

  User({required this.id, required this.name, required this.age});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, age: $age}';
  }

  static Future<void> insertUser(User user) async {
    final db = database;

    await db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> deleteUser(int id) async {
    final db = database;

    await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> editUser(User user) async {
    final db = database;

    await db.update('users', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }

  static Future<List<User>> users() async {
    // Get a reference to the database.
    final db = database;

    final List<Map<String, Object?>> userMaps = await db.query('users');

    return [
      for (final {
            'id': id as int,
            'name': name as String,
            'age': age as int,
          } in userMaps)
        User(id: id, name: name, age: age),
    ];
  }
}

import 'package:sqflite/sql.dart';

import '../main.dart';

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({
    required this.id,
    required this.name,
    required this.age,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }

  static Future<void> insertDog(Dog dog) async {
    final db = await database;

    await db.insert('dogs', dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> updateDog(Dog dog) async {
    final db = await database;

    await db.update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
  }

  static Future<void> deleteDog(int id) async {
    final db = await database;

    await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Dog>> dogs() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all the dogs.
    final List<Map<String, Object?>> dogMaps = await db.query('dogs');

    // Convert the list of each dog's fields into a list of `Dog` objects.
    return [
      for (final {
            'id': id as int,
            'name': name as String,
            'age': age as int,
          } in dogMaps)
        Dog(id: id, name: name, age: age),
    ];
  }
}

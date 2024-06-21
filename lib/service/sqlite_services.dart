import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

late Database database;
class SQLiteServices {
  SQLiteServices._internal();

  static final SQLiteServices instance = SQLiteServices._internal();

  Future<void> initDatabase() async {
    database = await openDatabase(
    join(await getDatabasesPath(), 'doggie_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    },
    version: 1
  );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/navigation/setup_route.dart';
import 'package:flutter_new_architectua/store/config_store.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

late Database database;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = await openDatabase(
    join(await getDatabasesPath(), 'users_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
      );
    },
    version: 1
  );
  configureInjection();
  runApp(const MyApp());
}

final _router = SetupRoute();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router.appRouter,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

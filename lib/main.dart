import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.dart';
import 'package:flutter_new_architectua/core/storage/config_store.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:path/path.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

late Database database;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  database =
      await openDatabase(join(await getDatabasesPath(), 'users_database.db'),
          onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
    );
  }, version: 1);

  Stripe.publishableKey = "pk_test_51QCZ0XFY945TtdO6oyFGuepcvs8MN2uX4zDBeVbtTy9DWSI9xf9bXYphyzSytKE18el6QUud6BYh0ZOBplSNQB2k00f5LHYMP0";
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
  configureInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GetIt.instance.get<AppRouter>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router.config(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

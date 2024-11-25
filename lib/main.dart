import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/core/bloc/goods/goods_bloc.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.dart';
import 'package:flutter_new_architectua/core/storage/config_storage.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:path/path.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

late Database database;
final GoodsBloc blocGoods = GetIt.instance.get<GoodsBloc>();

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

  Stripe.publishableKey =
      "pk_test_51QCZ0XFY945TtdO6oyFGuepcvs8MN2uX4zDBeVbtTy9DWSI9xf9bXYphyzSytKE18el6QUud6BYh0ZOBplSNQB2k00f5LHYMP0";
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
  configureInjection();
  runApp(BlocProvider(
    create: (_) => blocGoods,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GetIt.instance.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router.config(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return Material(
          child: Overlay(
            initialEntries: [
              OverlayEntry(
                builder: (context) => child ?? const SizedBox(),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:path/path.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_new_architectua/firebase_options.dart';
import 'package:flutter_new_architectua/core/bloc/cart/cart_bloc.dart';
import 'package:flutter_new_architectua/core/bloc/goods/goods_bloc.dart';
import 'package:flutter_new_architectua/core/bloc/profile/profile_bloc.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.dart';
import 'package:flutter_new_architectua/core/storage/config_storage.dart';

late Database database;
final GoodsBloc blocGoods = GetIt.instance.get<GoodsBloc>();
final CartBloc blocCart = GetIt.instance.get<CartBloc>();
final ProfileBloc blocProfile = GetIt.instance.get<ProfileBloc>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await dotenv.load();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Create table users
  // database =
  //     await openDatabase(join(await getDatabasesPath(), 'users_database.db'),
  //         onCreate: (db, version) {
  //   return db.execute(
  //     'CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
  //   );
  // }, version: 1);

  // Create table goods
  database =
      await openDatabase(join(await getDatabasesPath(), 'goods_database.db'),
          onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE goods(id INTEGER PRIMARY KEY, product_id TEXT NOT NULL, image_url TEXT, name TEXT NOT NULL, price TEXT, quantity INTEGER, company TEXT)');
  }, version: 1);

  // Setting stripe
  Stripe.publishableKey = "pk_test_TYooMQauvdEDq54NiTphI7jx";
  // Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  // Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();

  configureInjection();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<GoodsBloc>(
          create: (_) => blocGoods,
        ),
        BlocProvider<CartBloc>(
          create: (_) => blocCart,
        ),
        BlocProvider<ProfileBloc>(
          create: (_) => blocProfile,
        ),
      ],
      child: MyApp(),
    ),
  );
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

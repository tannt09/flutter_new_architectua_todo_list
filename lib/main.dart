import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/navigation/setup_route.dart';
import 'package:flutter_new_architectua/store/config_store.dart';

Future<void> main() async {
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

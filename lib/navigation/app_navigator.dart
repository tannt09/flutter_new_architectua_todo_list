import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  const AppNavigator();
}
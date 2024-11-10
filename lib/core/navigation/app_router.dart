import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/core/services/overlay_service.dart';
import 'package:injectable/injectable.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
@LazySingleton()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AdsRoute.page),
        AutoRoute(page: AuthRoute.page, initial: true),
        AutoRoute(page: BottomNavigation.page),
        AutoRoute(page: CountRoute.page),
        AutoRoute(page: PaymentCreditCardRoute.page),
        AutoRoute(page: Products.page),
        AutoRoute(page: TodoListRoute.page),
        AutoRoute(page: TodoListGraphQLRoute.page),
      ];

  @override
  GlobalKey<NavigatorState> get navigatorKey => OverlayService.navigatorKey;
}

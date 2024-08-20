import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
@LazySingleton()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: Products.page, initial: true),
        AutoRoute(page: TodoListRoute.page),
        AutoRoute(page: TodoListGraphQLRoute.page),
        AutoRoute(page: CountRoute.page),
        AutoRoute(page: AdsRoute.page),
      ];
}

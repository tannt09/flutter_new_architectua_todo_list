import 'package:flutter_new_architectua/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/view/count/count.dart';
import 'package:go_router/go_router.dart';

class SetupRoute {
  late final GoRouter appRouter = GoRouter(
    initialLocation: '/${CountPage.route}',
    navigatorKey: AppNavigator.navigatorKey,
    routes: [
      GoRoute(
        name: CountPage.route,
        path: '/${CountPage.route}',
        builder: (context, state) => const CountPage(title: "Increase Count")
      ),
    ]
  );
}
import 'package:auto_route/auto_route.dart';
import 'package:flutter_new_architectua/core/navigation/app_router.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AppNavigator {
  const AppNavigator(this._appRouter);

  final AppRouter _appRouter;

  Future<T?>? push<T extends Object?>(PageRouteInfo route) => _appRouter.push<T>(route);

  Future<T?>? replace<T extends Object?>(PageRouteInfo route) => _appRouter.replace<T>(route);

  /// Pop the top page off the Navigator's page stack by calling
  /// [Navigator.pop].
  void pop<T extends Object?>([T? result]) => _appRouter.maybePop(result);
}

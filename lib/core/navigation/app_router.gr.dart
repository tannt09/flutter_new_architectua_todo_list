// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:flutter_new_architectua/screen/ecommer/auth/auth.dart' as _i2;
import 'package:flutter_new_architectua/screen/ecommer/bottom_navigation/bottom_navigation.dart'
    as _i3;
import 'package:flutter_new_architectua/screen/ecommer/cart/cart_screen.dart'
    as _i4;
import 'package:flutter_new_architectua/screen/ecommer/goods_detail.dart'
    as _i6;
import 'package:flutter_new_architectua/screen/ecommer/home/goods_screen.dart'
    as _i7;
import 'package:flutter_new_architectua/screen/ecommer/payment/payment_credit_card_screen.dart'
    as _i8;
import 'package:flutter_new_architectua/screen/ecommer/splash/splash.dart'
    as _i10;
import 'package:flutter_new_architectua/screen/example/ads/ads.dart' as _i1;
import 'package:flutter_new_architectua/screen/example/count/count.dart' as _i5;
import 'package:flutter_new_architectua/screen/example/todo_list/todo_list.dart'
    as _i11;
import 'package:flutter_new_architectua/screen/example/todo_list/todo_list_products.dart'
    as _i9;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AdsRoute.name: (routeData) {
      final args = routeData.argsAs<AdsRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AdsPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AuthPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    BottomNavigation.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BottomNavigation(),
      );
    },
    CartRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CartPage(),
      );
    },
    CountRoute.name: (routeData) {
      final args = routeData.argsAs<CountRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CountPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    GoodsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<GoodsDetailRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.GoodsDetailPage(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
    GoodsRoute.name: (routeData) {
      final args = routeData.argsAs<GoodsRouteArgs>(
          orElse: () => const GoodsRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.GoodsPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    PaymentCreditCardRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentCreditCardRouteArgs>(
          orElse: () => const PaymentCreditCardRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.PaymentCreditCardPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    ProductsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductsRouteArgs>(
          orElse: () => const ProductsRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ProductsPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SplashPage(),
      );
    },
    TodoListRoute.name: (routeData) {
      final args = routeData.argsAs<TodoListRouteArgs>(
          orElse: () => const TodoListRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.TodoListPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AdsPage]
class AdsRoute extends _i12.PageRouteInfo<AdsRouteArgs> {
  AdsRoute({
    _i13.Key? key,
    required String title,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          AdsRoute.name,
          args: AdsRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'AdsRoute';

  static const _i12.PageInfo<AdsRouteArgs> page =
      _i12.PageInfo<AdsRouteArgs>(name);
}

class AdsRouteArgs {
  const AdsRouteArgs({
    this.key,
    required this.title,
  });

  final _i13.Key? key;

  final String title;

  @override
  String toString() {
    return 'AdsRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i12.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i13.Key? key,
    String title = "Login",
    List<_i12.PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i12.PageInfo<AuthRouteArgs> page =
      _i12.PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    this.title = "Login",
  });

  final _i13.Key? key;

  final String title;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i3.BottomNavigation]
class BottomNavigation extends _i12.PageRouteInfo<void> {
  const BottomNavigation({List<_i12.PageRouteInfo>? children})
      : super(
          BottomNavigation.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigation';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CartPage]
class CartRoute extends _i12.PageRouteInfo<void> {
  const CartRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CountPage]
class CountRoute extends _i12.PageRouteInfo<CountRouteArgs> {
  CountRoute({
    _i13.Key? key,
    required String title,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          CountRoute.name,
          args: CountRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'CountRoute';

  static const _i12.PageInfo<CountRouteArgs> page =
      _i12.PageInfo<CountRouteArgs>(name);
}

class CountRouteArgs {
  const CountRouteArgs({
    this.key,
    required this.title,
  });

  final _i13.Key? key;

  final String title;

  @override
  String toString() {
    return 'CountRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i6.GoodsDetailPage]
class GoodsDetailRoute extends _i12.PageRouteInfo<GoodsDetailRouteArgs> {
  GoodsDetailRoute({
    _i13.Key? key,
    required String productId,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          GoodsDetailRoute.name,
          args: GoodsDetailRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'GoodsDetailRoute';

  static const _i12.PageInfo<GoodsDetailRouteArgs> page =
      _i12.PageInfo<GoodsDetailRouteArgs>(name);
}

class GoodsDetailRouteArgs {
  const GoodsDetailRouteArgs({
    this.key,
    required this.productId,
  });

  final _i13.Key? key;

  final String productId;

  @override
  String toString() {
    return 'GoodsDetailRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [_i7.GoodsPage]
class GoodsRoute extends _i12.PageRouteInfo<GoodsRouteArgs> {
  GoodsRoute({
    _i13.Key? key,
    String title = "Products",
    List<_i12.PageRouteInfo>? children,
  }) : super(
          GoodsRoute.name,
          args: GoodsRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'GoodsRoute';

  static const _i12.PageInfo<GoodsRouteArgs> page =
      _i12.PageInfo<GoodsRouteArgs>(name);
}

class GoodsRouteArgs {
  const GoodsRouteArgs({
    this.key,
    this.title = "Products",
  });

  final _i13.Key? key;

  final String title;

  @override
  String toString() {
    return 'GoodsRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i8.PaymentCreditCardPage]
class PaymentCreditCardRoute
    extends _i12.PageRouteInfo<PaymentCreditCardRouteArgs> {
  PaymentCreditCardRoute({
    _i13.Key? key,
    String title = "Payment Credit Card",
    List<_i12.PageRouteInfo>? children,
  }) : super(
          PaymentCreditCardRoute.name,
          args: PaymentCreditCardRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentCreditCardRoute';

  static const _i12.PageInfo<PaymentCreditCardRouteArgs> page =
      _i12.PageInfo<PaymentCreditCardRouteArgs>(name);
}

class PaymentCreditCardRouteArgs {
  const PaymentCreditCardRouteArgs({
    this.key,
    this.title = "Payment Credit Card",
  });

  final _i13.Key? key;

  final String title;

  @override
  String toString() {
    return 'PaymentCreditCardRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i9.ProductsPage]
class ProductsRoute extends _i12.PageRouteInfo<ProductsRouteArgs> {
  ProductsRoute({
    _i13.Key? key,
    String title = "Products",
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ProductsRoute.name,
          args: ProductsRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';

  static const _i12.PageInfo<ProductsRouteArgs> page =
      _i12.PageInfo<ProductsRouteArgs>(name);
}

class ProductsRouteArgs {
  const ProductsRouteArgs({
    this.key,
    this.title = "Products",
  });

  final _i13.Key? key;

  final String title;

  @override
  String toString() {
    return 'ProductsRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i10.SplashPage]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.TodoListPage]
class TodoListRoute extends _i12.PageRouteInfo<TodoListRouteArgs> {
  TodoListRoute({
    _i13.Key? key,
    String title = "TodoList Screen",
    List<_i12.PageRouteInfo>? children,
  }) : super(
          TodoListRoute.name,
          args: TodoListRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'TodoListRoute';

  static const _i12.PageInfo<TodoListRouteArgs> page =
      _i12.PageInfo<TodoListRouteArgs>(name);
}

class TodoListRouteArgs {
  const TodoListRouteArgs({
    this.key,
    this.title = "TodoList Screen",
  });

  final _i13.Key? key;

  final String title;

  @override
  String toString() {
    return 'TodoListRouteArgs{key: $key, title: $title}';
  }
}

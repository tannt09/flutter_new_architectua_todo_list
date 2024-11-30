// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i14;

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:flutter_new_architectua/model/goods_model.dart' as _i13;
import 'package:flutter_new_architectua/screen/ecommer/auth/auth.dart' as _i2;
import 'package:flutter_new_architectua/screen/ecommer/bottom_navigation/bottom_navigation.dart'
    as _i3;
import 'package:flutter_new_architectua/screen/ecommer/goods_detail.dart'
    as _i5;
import 'package:flutter_new_architectua/screen/ecommer/home/goods_screen.dart'
    as _i6;
import 'package:flutter_new_architectua/screen/ecommer/payment/payment_credit_card_screen.dart'
    as _i7;
import 'package:flutter_new_architectua/screen/ecommer/splash/splash.dart'
    as _i9;
import 'package:flutter_new_architectua/screen/example/ads/ads.dart' as _i1;
import 'package:flutter_new_architectua/screen/example/count/count.dart' as _i4;
import 'package:flutter_new_architectua/screen/example/todo_list/todo_list.dart'
    as _i10;
import 'package:flutter_new_architectua/screen/example/todo_list/todo_list_products.dart'
    as _i8;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AdsRoute.name: (routeData) {
      final args = routeData.argsAs<AdsRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
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
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AuthPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    BottomNavigation.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BottomNavigation(),
      );
    },
    CountRoute.name: (routeData) {
      final args = routeData.argsAs<CountRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CountPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    GoodsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<GoodsDetailRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.GoodsDetailPage(
          key: args.key,
          item: args.item,
          changeFavoriteState: args.changeFavoriteState,
        ),
      );
    },
    GoodsRoute.name: (routeData) {
      final args = routeData.argsAs<GoodsRouteArgs>(
          orElse: () => const GoodsRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.GoodsPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    PaymentCreditCardRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentCreditCardRouteArgs>(
          orElse: () => const PaymentCreditCardRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.PaymentCreditCardPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    ProductsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductsRouteArgs>(
          orElse: () => const ProductsRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ProductsPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SplashPage(),
      );
    },
    TodoListRoute.name: (routeData) {
      final args = routeData.argsAs<TodoListRouteArgs>(
          orElse: () => const TodoListRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.TodoListPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AdsPage]
class AdsRoute extends _i11.PageRouteInfo<AdsRouteArgs> {
  AdsRoute({
    _i12.Key? key,
    required String title,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          AdsRoute.name,
          args: AdsRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'AdsRoute';

  static const _i11.PageInfo<AdsRouteArgs> page =
      _i11.PageInfo<AdsRouteArgs>(name);
}

class AdsRouteArgs {
  const AdsRouteArgs({
    this.key,
    required this.title,
  });

  final _i12.Key? key;

  final String title;

  @override
  String toString() {
    return 'AdsRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i11.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i12.Key? key,
    String title = "Login",
    List<_i11.PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i11.PageInfo<AuthRouteArgs> page =
      _i11.PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    this.title = "Login",
  });

  final _i12.Key? key;

  final String title;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i3.BottomNavigation]
class BottomNavigation extends _i11.PageRouteInfo<void> {
  const BottomNavigation({List<_i11.PageRouteInfo>? children})
      : super(
          BottomNavigation.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigation';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CountPage]
class CountRoute extends _i11.PageRouteInfo<CountRouteArgs> {
  CountRoute({
    _i12.Key? key,
    required String title,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          CountRoute.name,
          args: CountRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'CountRoute';

  static const _i11.PageInfo<CountRouteArgs> page =
      _i11.PageInfo<CountRouteArgs>(name);
}

class CountRouteArgs {
  const CountRouteArgs({
    this.key,
    required this.title,
  });

  final _i12.Key? key;

  final String title;

  @override
  String toString() {
    return 'CountRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i5.GoodsDetailPage]
class GoodsDetailRoute extends _i11.PageRouteInfo<GoodsDetailRouteArgs> {
  GoodsDetailRoute({
    _i12.Key? key,
    required _i13.GoodsModel item,
    _i14.Future<void> Function(_i13.GoodsModel)? changeFavoriteState,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          GoodsDetailRoute.name,
          args: GoodsDetailRouteArgs(
            key: key,
            item: item,
            changeFavoriteState: changeFavoriteState,
          ),
          initialChildren: children,
        );

  static const String name = 'GoodsDetailRoute';

  static const _i11.PageInfo<GoodsDetailRouteArgs> page =
      _i11.PageInfo<GoodsDetailRouteArgs>(name);
}

class GoodsDetailRouteArgs {
  const GoodsDetailRouteArgs({
    this.key,
    required this.item,
    this.changeFavoriteState,
  });

  final _i12.Key? key;

  final _i13.GoodsModel item;

  final _i14.Future<void> Function(_i13.GoodsModel)? changeFavoriteState;

  @override
  String toString() {
    return 'GoodsDetailRouteArgs{key: $key, item: $item, changeFavoriteState: $changeFavoriteState}';
  }
}

/// generated route for
/// [_i6.GoodsPage]
class GoodsRoute extends _i11.PageRouteInfo<GoodsRouteArgs> {
  GoodsRoute({
    _i12.Key? key,
    String title = "Products",
    List<_i11.PageRouteInfo>? children,
  }) : super(
          GoodsRoute.name,
          args: GoodsRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'GoodsRoute';

  static const _i11.PageInfo<GoodsRouteArgs> page =
      _i11.PageInfo<GoodsRouteArgs>(name);
}

class GoodsRouteArgs {
  const GoodsRouteArgs({
    this.key,
    this.title = "Products",
  });

  final _i12.Key? key;

  final String title;

  @override
  String toString() {
    return 'GoodsRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i7.PaymentCreditCardPage]
class PaymentCreditCardRoute
    extends _i11.PageRouteInfo<PaymentCreditCardRouteArgs> {
  PaymentCreditCardRoute({
    _i12.Key? key,
    String title = "Payment Credit Card",
    List<_i11.PageRouteInfo>? children,
  }) : super(
          PaymentCreditCardRoute.name,
          args: PaymentCreditCardRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentCreditCardRoute';

  static const _i11.PageInfo<PaymentCreditCardRouteArgs> page =
      _i11.PageInfo<PaymentCreditCardRouteArgs>(name);
}

class PaymentCreditCardRouteArgs {
  const PaymentCreditCardRouteArgs({
    this.key,
    this.title = "Payment Credit Card",
  });

  final _i12.Key? key;

  final String title;

  @override
  String toString() {
    return 'PaymentCreditCardRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i8.ProductsPage]
class ProductsRoute extends _i11.PageRouteInfo<ProductsRouteArgs> {
  ProductsRoute({
    _i12.Key? key,
    String title = "Products",
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ProductsRoute.name,
          args: ProductsRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';

  static const _i11.PageInfo<ProductsRouteArgs> page =
      _i11.PageInfo<ProductsRouteArgs>(name);
}

class ProductsRouteArgs {
  const ProductsRouteArgs({
    this.key,
    this.title = "Products",
  });

  final _i12.Key? key;

  final String title;

  @override
  String toString() {
    return 'ProductsRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i9.SplashPage]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TodoListPage]
class TodoListRoute extends _i11.PageRouteInfo<TodoListRouteArgs> {
  TodoListRoute({
    _i12.Key? key,
    String title = "TodoList Screen",
    List<_i11.PageRouteInfo>? children,
  }) : super(
          TodoListRoute.name,
          args: TodoListRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'TodoListRoute';

  static const _i11.PageInfo<TodoListRouteArgs> page =
      _i11.PageInfo<TodoListRouteArgs>(name);
}

class TodoListRouteArgs {
  const TodoListRouteArgs({
    this.key,
    this.title = "TodoList Screen",
  });

  final _i12.Key? key;

  final String title;

  @override
  String toString() {
    return 'TodoListRouteArgs{key: $key, title: $title}';
  }
}

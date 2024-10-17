// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:flutter_new_architectua/view/ads/ads.dart' as _i1;
import 'package:flutter_new_architectua/view/auth/auth.dart' as _i2;
import 'package:flutter_new_architectua/view/bottom_navigation/bottom_navigation.dart'
    as _i3;
import 'package:flutter_new_architectua/view/count/count.dart' as _i4;
import 'package:flutter_new_architectua/view/payment/payment_credit_card_screen.dart'
    as _i5;
import 'package:flutter_new_architectua/view/todo_list/todo_list.dart' as _i8;
import 'package:flutter_new_architectua/view/todo_list/todo_list_graphql.dart'
    as _i7;
import 'package:flutter_new_architectua/view/todo_list/todo_list_products.dart'
    as _i6;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AdsRoute.name: (routeData) {
      final args = routeData.argsAs<AdsRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
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
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AuthPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    BottomNavigation.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BottomNavigation(),
      );
    },
    CountRoute.name: (routeData) {
      final args = routeData.argsAs<CountRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CountPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    PaymentCreditCardRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentCreditCardRouteArgs>(
          orElse: () => const PaymentCreditCardRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.PaymentCreditCardPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    Products.name: (routeData) {
      final args =
          routeData.argsAs<ProductsArgs>(orElse: () => const ProductsArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.Products(
          key: args.key,
          title: args.title,
        ),
      );
    },
    TodoListGraphQLRoute.name: (routeData) {
      final args = routeData.argsAs<TodoListGraphQLRouteArgs>(
          orElse: () => const TodoListGraphQLRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.TodoListGraphQLPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    TodoListRoute.name: (routeData) {
      final args = routeData.argsAs<TodoListRouteArgs>(
          orElse: () => const TodoListRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.TodoListPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    _PaymentCreditCardRouteState.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _PaymentCreditCardPageState(),
      );
    },
  };
}

/// generated route for
/// [_i1.AdsPage]
class AdsRoute extends _i9.PageRouteInfo<AdsRouteArgs> {
  AdsRoute({
    _i10.Key? key,
    required String title,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          AdsRoute.name,
          args: AdsRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'AdsRoute';

  static const _i9.PageInfo<AdsRouteArgs> page =
      _i9.PageInfo<AdsRouteArgs>(name);
}

class AdsRouteArgs {
  const AdsRouteArgs({
    this.key,
    required this.title,
  });

  final _i10.Key? key;

  final String title;

  @override
  String toString() {
    return 'AdsRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i9.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i10.Key? key,
    String title = "Login",
    List<_i9.PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i9.PageInfo<AuthRouteArgs> page =
      _i9.PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    this.title = "Login",
  });

  final _i10.Key? key;

  final String title;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i3.BottomNavigation]
class BottomNavigation extends _i9.PageRouteInfo<void> {
  const BottomNavigation({List<_i9.PageRouteInfo>? children})
      : super(
          BottomNavigation.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigation';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CountPage]
class CountRoute extends _i9.PageRouteInfo<CountRouteArgs> {
  CountRoute({
    _i10.Key? key,
    required String title,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          CountRoute.name,
          args: CountRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'CountRoute';

  static const _i9.PageInfo<CountRouteArgs> page =
      _i9.PageInfo<CountRouteArgs>(name);
}

class CountRouteArgs {
  const CountRouteArgs({
    this.key,
    required this.title,
  });

  final _i10.Key? key;

  final String title;

  @override
  String toString() {
    return 'CountRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i5.PaymentCreditCardPage]
class PaymentCreditCardRoute
    extends _i9.PageRouteInfo<PaymentCreditCardRouteArgs> {
  PaymentCreditCardRoute({
    _i10.Key? key,
    String title = "Payment Credit Card",
    List<_i9.PageRouteInfo>? children,
  }) : super(
          PaymentCreditCardRoute.name,
          args: PaymentCreditCardRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentCreditCardRoute';

  static const _i9.PageInfo<PaymentCreditCardRouteArgs> page =
      _i9.PageInfo<PaymentCreditCardRouteArgs>(name);
}

class PaymentCreditCardRouteArgs {
  const PaymentCreditCardRouteArgs({
    this.key,
    this.title = "Payment Credit Card",
  });

  final _i10.Key? key;

  final String title;

  @override
  String toString() {
    return 'PaymentCreditCardRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i6.Products]
class Products extends _i9.PageRouteInfo<ProductsArgs> {
  Products({
    _i10.Key? key,
    String title = "Products",
    List<_i9.PageRouteInfo>? children,
  }) : super(
          Products.name,
          args: ProductsArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'Products';

  static const _i9.PageInfo<ProductsArgs> page =
      _i9.PageInfo<ProductsArgs>(name);
}

class ProductsArgs {
  const ProductsArgs({
    this.key,
    this.title = "Products",
  });

  final _i10.Key? key;

  final String title;

  @override
  String toString() {
    return 'ProductsArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i7.TodoListGraphQLPage]
class TodoListGraphQLRoute extends _i9.PageRouteInfo<TodoListGraphQLRouteArgs> {
  TodoListGraphQLRoute({
    _i10.Key? key,
    String title = "TodoList Screen",
    List<_i9.PageRouteInfo>? children,
  }) : super(
          TodoListGraphQLRoute.name,
          args: TodoListGraphQLRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'TodoListGraphQLRoute';

  static const _i9.PageInfo<TodoListGraphQLRouteArgs> page =
      _i9.PageInfo<TodoListGraphQLRouteArgs>(name);
}

class TodoListGraphQLRouteArgs {
  const TodoListGraphQLRouteArgs({
    this.key,
    this.title = "TodoList Screen",
  });

  final _i10.Key? key;

  final String title;

  @override
  String toString() {
    return 'TodoListGraphQLRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i8.TodoListPage]
class TodoListRoute extends _i9.PageRouteInfo<TodoListRouteArgs> {
  TodoListRoute({
    _i10.Key? key,
    String title = "TodoList Screen",
    List<_i9.PageRouteInfo>? children,
  }) : super(
          TodoListRoute.name,
          args: TodoListRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'TodoListRoute';

  static const _i9.PageInfo<TodoListRouteArgs> page =
      _i9.PageInfo<TodoListRouteArgs>(name);
}

class TodoListRouteArgs {
  const TodoListRouteArgs({
    this.key,
    this.title = "TodoList Screen",
  });

  final _i10.Key? key;

  final String title;

  @override
  String toString() {
    return 'TodoListRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_PaymentCreditCardPageState]
class _PaymentCreditCardRouteState extends _i9.PageRouteInfo<void> {
  const _PaymentCreditCardRouteState({List<_i9.PageRouteInfo>? children})
      : super(
          _PaymentCreditCardRouteState.name,
          initialChildren: children,
        );

  static const String name = '_PaymentCreditCardRouteState';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:flutter_new_architectua/view/ads/ads.dart' as _i1;
import 'package:flutter_new_architectua/view/auth/auth.dart' as _i2;
import 'package:flutter_new_architectua/view/count/count.dart' as _i3;
import 'package:flutter_new_architectua/view/todo_list/todo_list.dart' as _i6;
import 'package:flutter_new_architectua/view/todo_list/todo_list_graphql.dart'
    as _i5;
import 'package:flutter_new_architectua/view/todo_list/todo_list_products.dart'
    as _i4;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AdsRoute.name: (routeData) {
      final args = routeData.argsAs<AdsRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
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
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AuthPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    CountRoute.name: (routeData) {
      final args = routeData.argsAs<CountRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CountPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    Products.name: (routeData) {
      final args =
          routeData.argsAs<ProductsArgs>(orElse: () => const ProductsArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.Products(
          key: args.key,
          title: args.title,
        ),
      );
    },
    TodoListGraphQLRoute.name: (routeData) {
      final args = routeData.argsAs<TodoListGraphQLRouteArgs>(
          orElse: () => const TodoListGraphQLRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.TodoListGraphQLPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    TodoListRoute.name: (routeData) {
      final args = routeData.argsAs<TodoListRouteArgs>(
          orElse: () => const TodoListRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.TodoListPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AdsPage]
class AdsRoute extends _i7.PageRouteInfo<AdsRouteArgs> {
  AdsRoute({
    _i8.Key? key,
    required String title,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AdsRoute.name,
          args: AdsRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'AdsRoute';

  static const _i7.PageInfo<AdsRouteArgs> page =
      _i7.PageInfo<AdsRouteArgs>(name);
}

class AdsRouteArgs {
  const AdsRouteArgs({
    this.key,
    required this.title,
  });

  final _i8.Key? key;

  final String title;

  @override
  String toString() {
    return 'AdsRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i7.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i8.Key? key,
    String title = "Login",
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i7.PageInfo<AuthRouteArgs> page =
      _i7.PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    this.title = "Login",
  });

  final _i8.Key? key;

  final String title;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i3.CountPage]
class CountRoute extends _i7.PageRouteInfo<CountRouteArgs> {
  CountRoute({
    _i8.Key? key,
    required String title,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          CountRoute.name,
          args: CountRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'CountRoute';

  static const _i7.PageInfo<CountRouteArgs> page =
      _i7.PageInfo<CountRouteArgs>(name);
}

class CountRouteArgs {
  const CountRouteArgs({
    this.key,
    required this.title,
  });

  final _i8.Key? key;

  final String title;

  @override
  String toString() {
    return 'CountRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i4.Products]
class Products extends _i7.PageRouteInfo<ProductsArgs> {
  Products({
    _i8.Key? key,
    String title = "Products",
    List<_i7.PageRouteInfo>? children,
  }) : super(
          Products.name,
          args: ProductsArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'Products';

  static const _i7.PageInfo<ProductsArgs> page =
      _i7.PageInfo<ProductsArgs>(name);
}

class ProductsArgs {
  const ProductsArgs({
    this.key,
    this.title = "Products",
  });

  final _i8.Key? key;

  final String title;

  @override
  String toString() {
    return 'ProductsArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i5.TodoListGraphQLPage]
class TodoListGraphQLRoute extends _i7.PageRouteInfo<TodoListGraphQLRouteArgs> {
  TodoListGraphQLRoute({
    _i8.Key? key,
    String title = "TodoList Screen",
    List<_i7.PageRouteInfo>? children,
  }) : super(
          TodoListGraphQLRoute.name,
          args: TodoListGraphQLRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'TodoListGraphQLRoute';

  static const _i7.PageInfo<TodoListGraphQLRouteArgs> page =
      _i7.PageInfo<TodoListGraphQLRouteArgs>(name);
}

class TodoListGraphQLRouteArgs {
  const TodoListGraphQLRouteArgs({
    this.key,
    this.title = "TodoList Screen",
  });

  final _i8.Key? key;

  final String title;

  @override
  String toString() {
    return 'TodoListGraphQLRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i6.TodoListPage]
class TodoListRoute extends _i7.PageRouteInfo<TodoListRouteArgs> {
  TodoListRoute({
    _i8.Key? key,
    String title = "TodoList Screen",
    List<_i7.PageRouteInfo>? children,
  }) : super(
          TodoListRoute.name,
          args: TodoListRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'TodoListRoute';

  static const _i7.PageInfo<TodoListRouteArgs> page =
      _i7.PageInfo<TodoListRouteArgs>(name);
}

class TodoListRouteArgs {
  const TodoListRouteArgs({
    this.key,
    this.title = "TodoList Screen",
  });

  final _i8.Key? key;

  final String title;

  @override
  String toString() {
    return 'TodoListRouteArgs{key: $key, title: $title}';
  }
}

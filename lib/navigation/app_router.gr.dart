// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter_new_architectua/view/ads/ads.dart' as _i1;
import 'package:flutter_new_architectua/view/count/count.dart' as _i2;
import 'package:flutter_new_architectua/view/todo_list/todo_list.dart' as _i5;
import 'package:flutter_new_architectua/view/todo_list/todo_list_graphql.dart'
    as _i4;
import 'package:flutter_new_architectua/view/todo_list/todo_list_products.dart'
    as _i3;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AdsRoute.name: (routeData) {
      final args = routeData.argsAs<AdsRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AdsPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    CountRoute.name: (routeData) {
      final args = routeData.argsAs<CountRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CountPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    Products.name: (routeData) {
      final args =
          routeData.argsAs<ProductsArgs>(orElse: () => const ProductsArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.Products(
          key: args.key,
          title: args.title,
        ),
      );
    },
    TodoListGraphQLRoute.name: (routeData) {
      final args = routeData.argsAs<TodoListGraphQLRouteArgs>(
          orElse: () => const TodoListGraphQLRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.TodoListGraphQLPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    TodoListRoute.name: (routeData) {
      final args = routeData.argsAs<TodoListRouteArgs>(
          orElse: () => const TodoListRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.TodoListPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AdsPage]
class AdsRoute extends _i6.PageRouteInfo<AdsRouteArgs> {
  AdsRoute({
    _i7.Key? key,
    required String title,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          AdsRoute.name,
          args: AdsRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'AdsRoute';

  static const _i6.PageInfo<AdsRouteArgs> page =
      _i6.PageInfo<AdsRouteArgs>(name);
}

class AdsRouteArgs {
  const AdsRouteArgs({
    this.key,
    required this.title,
  });

  final _i7.Key? key;

  final String title;

  @override
  String toString() {
    return 'AdsRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i2.CountPage]
class CountRoute extends _i6.PageRouteInfo<CountRouteArgs> {
  CountRoute({
    _i7.Key? key,
    required String title,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          CountRoute.name,
          args: CountRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'CountRoute';

  static const _i6.PageInfo<CountRouteArgs> page =
      _i6.PageInfo<CountRouteArgs>(name);
}

class CountRouteArgs {
  const CountRouteArgs({
    this.key,
    required this.title,
  });

  final _i7.Key? key;

  final String title;

  @override
  String toString() {
    return 'CountRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i3.Products]
class Products extends _i6.PageRouteInfo<ProductsArgs> {
  Products({
    _i7.Key? key,
    String title = "Products",
    List<_i6.PageRouteInfo>? children,
  }) : super(
          Products.name,
          args: ProductsArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'Products';

  static const _i6.PageInfo<ProductsArgs> page =
      _i6.PageInfo<ProductsArgs>(name);
}

class ProductsArgs {
  const ProductsArgs({
    this.key,
    this.title = "Products",
  });

  final _i7.Key? key;

  final String title;

  @override
  String toString() {
    return 'ProductsArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i4.TodoListGraphQLPage]
class TodoListGraphQLRoute extends _i6.PageRouteInfo<TodoListGraphQLRouteArgs> {
  TodoListGraphQLRoute({
    _i7.Key? key,
    String title = "TodoList Screen",
    List<_i6.PageRouteInfo>? children,
  }) : super(
          TodoListGraphQLRoute.name,
          args: TodoListGraphQLRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'TodoListGraphQLRoute';

  static const _i6.PageInfo<TodoListGraphQLRouteArgs> page =
      _i6.PageInfo<TodoListGraphQLRouteArgs>(name);
}

class TodoListGraphQLRouteArgs {
  const TodoListGraphQLRouteArgs({
    this.key,
    this.title = "TodoList Screen",
  });

  final _i7.Key? key;

  final String title;

  @override
  String toString() {
    return 'TodoListGraphQLRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i5.TodoListPage]
class TodoListRoute extends _i6.PageRouteInfo<TodoListRouteArgs> {
  TodoListRoute({
    _i7.Key? key,
    String title = "TodoList Screen",
    List<_i6.PageRouteInfo>? children,
  }) : super(
          TodoListRoute.name,
          args: TodoListRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'TodoListRoute';

  static const _i6.PageInfo<TodoListRouteArgs> page =
      _i6.PageInfo<TodoListRouteArgs>(name);
}

class TodoListRouteArgs {
  const TodoListRouteArgs({
    this.key,
    this.title = "TodoList Screen",
  });

  final _i7.Key? key;

  final String title;

  @override
  String toString() {
    return 'TodoListRouteArgs{key: $key, title: $title}';
  }
}

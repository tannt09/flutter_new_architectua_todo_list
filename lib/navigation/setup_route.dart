import 'package:flutter_new_architectua/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/view/count/count.dart';
import 'package:flutter_new_architectua/view/todo_list/todo_list.dart';
import 'package:go_router/go_router.dart';

class SetupRoute {
  late final GoRouter appRouter = GoRouter(
    initialLocation: '/${TodoListPage.route}',
    navigatorKey: AppNavigator.navigatorKey,
    routes: [
      GoRoute(
        name: CountPage.route,
        path: '/${CountPage.route}',
        builder: (context, state) => const CountPage(title: "Increase Count")
      ),
      GoRoute(
        name: TodoListPage.route,
        path: '/${TodoListPage.route}',
        builder: (context, state) => const TodoListPage(title: "TodoList")
      ),
    ]
  );
}
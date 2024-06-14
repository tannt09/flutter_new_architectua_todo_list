import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/base/bloc/base_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/common/common_bloc.dart';
import '../navigation/app_navigator.dart';

abstract class BasePageState<T extends StatefulWidget, B extends BaseBloc>
    extends BasePageStateDelegate<T, B> {}

abstract class BasePageStateDelegate<T extends StatefulWidget,
    B extends BaseBloc> extends State<T> {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();

  late final CommonBloc commonBloc = GetIt.instance.get<CommonBloc>()
    ..navigator = navigator;

  late final B bloc = GetIt.instance.get<B>()..navigator = navigator;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => bloc),
        BlocProvider(create: (_) => commonBloc)
      ],
      child: buildPageListeners(
          child: Stack(
        children: [
          buildPage(context),
          BlocBuilder<CommonBloc, CommonState>(
              buildWhen: (prev, current) => true,
              builder: (context, state) => Text(
                    'HIIIIII',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ))
        ],
      )),
    );
  }

  Widget buildPage(BuildContext context);

  Widget buildPageListeners({required Widget child}) => child;

  @override
  void dispose() {
    super.dispose();
  }
}

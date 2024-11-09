import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../core/bloc/count/count_bloc.dart';

@RoutePage()
class CountPage extends StatefulWidget {
  const CountPage({super.key, required this.title});

  final String title;

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  late final CountBloc bloc = GetIt.instance.get<CountBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => bloc,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: BlocBuilder<CountBloc, CountState>(builder: (context, state) {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${state.count}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ]),
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () => bloc.add(const Count()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ));
  }
}
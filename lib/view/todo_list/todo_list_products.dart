import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/bloc/products/products_bloc.dart';
import 'package:flutter_new_architectua/navigation/app_navigator.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class Products extends StatefulWidget {
  final String title;
  const Products({super.key, this.title = "Products"});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();
  late final ProductsBloc bloc = GetIt.instance.get<ProductsBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}

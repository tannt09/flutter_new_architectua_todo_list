import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/bloc/products/products_bloc.dart';
import 'package:flutter_new_architectua/model/product.dart';
import 'package:flutter_new_architectua/navigation/app_navigator.dart';
import 'package:flutter_new_architectua/widget/custom_dialog.dart';
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (!state.products.isNotEmpty) {
              return const Text("Is empty");
            }

            Future<void> editProductFromList(Product newProduct) async {
              final id = newProduct.id;
              if (id != null) {
                bloc.add(EditProduct(id: id));
              }
            }

            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final item = state.products[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.title),
                                  Row(
                                    children: [
                                      Text(
                                        "${item.discounted_price}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          "${item.discount_percentage}",
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text("${item.original_price}"),
                                ],
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () => {},
                                child: const Icon(Icons.delete)),
                            ElevatedButton(
                                onPressed: () => {
                                      CustomDialog.showAddProductDialog(
                                          context, editProductFromList, item.id)
                                    },
                                child: const Icon(Icons.edit)),
                          ],
                        ),
                      ),
                    );
                  },
                )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: const Text("Add new product"),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

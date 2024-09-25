import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_new_architectua/bloc/products/products_bloc.dart';
import 'package:flutter_new_architectua/model/product_model.dart';
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
                bloc.add(EditProduct(product: newProduct));
              }
            }

            Future<void> addProductToList(Product newProduct) async {
              bloc.add(AddProduct(product: newProduct));
            }

            Future<void> deleteProductFromList(String? id) async {
              if (id != null) {
                bloc.add(DeleteProduct(id: id));
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
                                  Text(
                                    item.title ?? '',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Cormorant',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    item.description ?? '',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Cormorant',
                                        fontStyle: FontStyle.italic),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${item.discountedPrice}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          "${item.discountPercentage}%",
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text("${item.originalPrice}"),
                                ],
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () =>
                                    {deleteProductFromList(item.id)},
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
                    onPressed: () => {
                      CustomDialog.showAddProductDialog(
                          context, addProductToList)
                    },
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

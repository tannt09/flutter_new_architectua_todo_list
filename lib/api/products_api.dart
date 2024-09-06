import 'dart:convert';

import 'package:flutter_new_architectua/model/product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchAllProduct() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.5:3000/products/getAll'));

  if (response.statusCode == 200) {
    final List<dynamic> parsed = json.decode(response.body);

    return parsed
        .map<Product>((json) => Product.fromJson(json as Map<String, dynamic>))
        .toList();
  } else {
    return [];
  }
}

Future<String> fetchEditProduct(Product product) async {
  final url =
      Uri.parse('http://192.168.1.5:3000/products/update?id=${product.id}');
  final Map<String, dynamic> updatedData = {
    'original_price': product.original_price,
    'title': product.title
  };
  final response = await http.put(url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(updatedData));

  print('Status code update ${response.statusCode}');
  if (response.statusCode == 200) {
    return 'Update Success';
  } else {
    return 'Update Failure';
  }
}

Future<String> fetchDeleteProduct(String id) async {
  final url = Uri.parse('http://192.168.1.5:3000/products/delete?id=$id');
  final response = await http.delete(url);

  print('Status code delete ${response.statusCode}');
  if (response.statusCode == 200) {
    return 'Delete Success';
  } else {
    return 'Delete Failure';
  }
}

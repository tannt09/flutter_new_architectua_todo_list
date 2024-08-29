import 'dart:convert';

import 'package:flutter_new_architectua/model/product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchAllProduct() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.12:3000/products/getAll'));

  if (response.statusCode == 200) {
    final List<dynamic> parsed = json.decode(response.body);

    return parsed
        .map<Product>((json) => Product.fromJson(json as Map<String, dynamic>))
        .toList();
  } else {
    return [];
  }
}

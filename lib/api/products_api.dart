import 'dart:convert';

import 'package:flutter_new_architectua/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

final _logger = Logger('ProductsApi');

Future<List<Product>> fetchAllProduct() async {
  final url = Uri.parse('http://192.168.1.5:3000/products/getAll');
  
  try {
    final response = await http.get(url);
    _logger.info('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final List<dynamic> parsed = jsonDecode(response.body);
      return parsed.map<Product>((json) => Product.fromJson(json)).toList();
    } else {
      _logger.warning('Failed to fetch products. Status code: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    _logger.severe('Error fetching products: $e');
    return [];
  }
}

Future<String> fetchEditProduct(Product product) async {
  final url = Uri.parse('http://192.168.1.5:3000/products/update?id=${product.id}');
  final updatedData = product.toJson()..remove('id');
  
  try {
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedData),
    );

    return response.statusCode == 200 ? 'Update Success' : 'Update Failure';
  } catch (e) {
    _logger.severe('Error updating product: $e');
    return 'Update Failure';
  }
}

Future<String> fetchDeleteProduct(String id) async {
  final url = Uri.parse('http://192.168.1.5:3000/products/delete?id=$id');
  
  try {
    final response = await http.delete(url);
    _logger.info('Delete product status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return 'Delete Success';
    } else {
      _logger.warning('Failed to delete product. Status code: ${response.statusCode}');
      return 'Delete Failure';
    }
  } catch (e) {
    _logger.severe('Error deleting product: $e');
    return 'Delete Failure';
  }
}

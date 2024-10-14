import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_new_architectua/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _logger = Logger('ProductsApi');

// Function to retrieve the token
Future<String?> _getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString("CURRENT_TOKEN");
}

Future<List<Product>> fetchAllProduct() async {
  // Configure logger to print to console
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    log('${record.level.name}: ${record.time}: ${record.message}');
  });

  await dotenv.load();

  final url = Uri.parse('${dotenv.env['BASE_URL']}/products/getAll');
  final token = await _getToken(); // Use the new function to get the token

  try {
    _logger.info('Fetching products from: $url');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    _logger.info('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final List<dynamic> parsed = jsonDecode(response.body);
      return parsed.map<Product>((json) => Product.fromJson(json)).toList();
    } else {
      _logger.warning(
          'Failed to fetch products. Status code: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    _logger.severe('Error fetching products: $e');
    return [];
  }
}

Future<String> fetchEditProduct(Product product) async {
  await dotenv.load();

  final url =
      Uri.parse('${dotenv.env['BASE_URL']}/products/update?id=${product.id}');
  final updatedData = product.toJson()..remove('id');
  final token = await _getToken(); // Use the new function to get the token

  try {
    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(updatedData),
    );

    return response.statusCode == 200 ? 'Update Success' : 'Update Failure';
  } catch (e) {
    _logger.severe('Error updating product: $e');
    return 'Update Failure';
  }
}

Future<String> fetchAddNewProduct(Product product) async {
  final url = Uri.parse('${dotenv.env['BASE_URL']}/products/add');
  final newProductData = product.toJson()..remove('id');
  final token = await _getToken(); // Use the new function to get the token

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(newProductData),
    );

    return response.statusCode == 200
        ? 'Add product Success'
        : 'Add product Failure';
  } catch (e) {
    _logger.severe('Error Adding product: $e');
    return 'Add product Failure';
  }
}

Future<String> fetchDeleteProduct(String id) async {
  final url = Uri.parse('${dotenv.env['BASE_URL']}/products/delete?id=$id');
  final token = await _getToken(); // Use the new function to get the token

  try {
    final response = await http.delete(url, headers: {
      'Authorization': 'Bearer $token',
    });
    _logger.info('Delete product status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return 'Delete Success';
    } else {
      _logger.warning(
          'Failed to delete product. Status code: ${response.statusCode}');
      return 'Delete Failure';
    }
  } catch (e) {
    _logger.severe('Error deleting product: $e');
    return 'Delete Failure';
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_new_architectua/api/config/custom_api_client.dart';
import 'package:flutter_new_architectua/core/storage/token_secure_storage.dart';
import 'package:flutter_new_architectua/model/goods_model.dart';
import 'package:logging/logging.dart';

final _logger = Logger('ProductsApi');
ApiClient apiClient =
    ApiClient(baseUrl: '${dotenv.env['BASE_URL']}', storage: storage);

Future<List<GoodsModel>> fetchAllGoods(String endpoint) async {
  // Configure logger to print to console
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    log('${record.level.name}: ${record.time}: ${record.message}');
  });

  final token = await getAccessToken();

  try {
    final response = await apiClient.sendRequest(endpoint, 'GET', headers: {
      'Authorization': 'Bearer $token',
    });
    _logger.info('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final List<dynamic> parsed = jsonDecode(response.body);
      return parsed
          .map<GoodsModel>((json) => GoodsModel.fromJson(json))
          .toList();
    } else {
      _logger.warning(
          'Failed to fetch goods. Status code: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    _logger.severe('Error fetching goods: $e');
    return [];
  }
}

Future<List<GoodsModel>> fetchSearchGoods(String endpoint, String name) async {
  // Configure logger to print to console
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    log('${record.level.name}: ${record.time}: ${record.message}');
  });

  final token = await getAccessToken();

  try {
    final response =
        await apiClient.sendRequest('$endpoint?name=$name', 'GET', headers: {
      'Authorization': 'Bearer $token',
    });
    _logger.info('Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final List<dynamic> parsed = jsonDecode(response.body);
      return parsed
          .map<GoodsModel>((json) => GoodsModel.fromJson(json))
          .toList();
    } else {
      _logger.warning(
          'Failed to fetch goods. Status code: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    _logger.severe('Error fetching goods: $e');
    return [];
  }
}

Future<String> fetchChangeFavorite(GoodsModel item) async {
  // Configure logger to print to console
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    log('${record.level.name}: ${record.time}: ${record.message}');
  });

  final token = await getAccessToken();

  try {
    final response = await apiClient.sendRequest(
        'goods/changeFavorite?user_id=${item.productId}', 'PUT',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          'is_favorite': !item.isFavorite,
        });
    _logger.info('Status code: ${response.statusCode}');

    return response.body;
  } catch (e) {
    _logger.severe('Error changing favorite state: $e');
    return 'Error changing favorite state';
  }
}

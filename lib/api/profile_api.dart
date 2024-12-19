import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_new_architectua/api/config/custom_api_client.dart';
import 'package:flutter_new_architectua/core/storage/token_secure_storage.dart';
import 'package:flutter_new_architectua/model/profile_model.dart';
import 'package:logging/logging.dart';

final _logger = Logger('ProfileApi');
ApiClient apiClient =
    ApiClient(baseUrl: '${dotenv.env['BASE_URL']}', storage: storage);

Future<ProfileModel> fetchUserProfile(String userId) async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    log('${record.level.name}: ${record.time}: ${record.message}');
  });

  await dotenv.load();

  final token = await getAccessToken();

  try {
    final response = await apiClient.sendRequest(
      'users/getProfile?user_id=$userId',
      'GET',
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> parsed = jsonDecode(response.body);

      return ProfileModel.fromJson(parsed);
    }

    _logger.warning(
        'Failed to fetch user profile. Status code: ${response.statusCode}');
    return ProfileModel.initState();
  } catch (e) {
    _logger.severe('Error get user profile: $e');
    return ProfileModel.initState();
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:logging/logging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_new_architectua/api/config/custom_api_client.dart';
import 'package:flutter_new_architectua/core/storage/token_secure_storage.dart';
import 'package:flutter_new_architectua/model/profile_model.dart';

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

Future<String> editUserProfile(ProfileModel newProfile) async {
  await dotenv.load();

  final updatedData = newProfile.toJson()
    ..remove('id')
    ..remove('userId');
  final token = await getAccessToken();

  try {
    final response = await apiClient.sendRequest(
        'users/updateProfile?user_id=${newProfile.userId}', 'PUT',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: updatedData);

    return response.statusCode == 200
        ? 'Edit User Profile Success'
        : 'Edit User Profile Failure';
  } catch (e) {
    _logger.severe('Error Editing User Profile: $e');
    return 'Edit User Profile Failure';
  }
}

Future<UploadAvatarResponseModel> uploadAvatar(String path) async {
  await dotenv.load();

  try {
    final response = await apiClient.sendRequestWithFile(
      'uploads/image',
      'POST',
      path,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final Map<String, dynamic> parsed = jsonDecode(response.body);
    final UploadAvatarResponseModel result =
        UploadAvatarResponseModel.fromJson(parsed);

    _logger.severe('Uploaded Avatar Status: ${response.statusCode}');
    return result;
  } catch (e) {
    _logger.severe('Uploading Avatar Failure: $e');
    const UploadAvatarResponseModel defaultResult =
        UploadAvatarResponseModel(id: 0, imageUrl: '');
    return defaultResult;
  }
}

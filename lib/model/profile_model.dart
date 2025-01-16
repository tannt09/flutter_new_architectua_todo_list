class ProfileModel {
  final int? id;
  final String? userId;
  final String fullName;
  final String? email;
  final String? phoneNumber;
  final String? username;
  final int? gender;
  final String? dateOfBirth;
  final String? region;
  final String avatarUrl;

  const ProfileModel(
      {this.id,
      this.userId,
      this.fullName = 'NO NAME',
      this.email,
      this.phoneNumber,
      this.username,
      this.gender,
      this.dateOfBirth,
      this.region,
      this.avatarUrl = ''});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        id: json['id'],
        userId: json['user_id'],
        fullName: json['full_name'] ?? 'NO NAME',
        email: json['email'],
        phoneNumber: json['phone_number'] ?? '',
        username: json['username'],
        gender: json['gender'] ?? 0,
        dateOfBirth: json['date_of_birth'] ?? '2000-01-01',
        region: json['region'] ?? '',
        avatarUrl: json['avatar_url'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'full_name': fullName,
      'email': email,
      'phone_number': phoneNumber,
      'username': username,
      'gender': gender,
      'date_of_birth': dateOfBirth,
      'region': region,
      'avatar_url': avatarUrl,
    };
  }

  static ProfileModel initState() {
    return const ProfileModel(
        id: 0,
        userId: '',
        fullName: 'NO NAME',
        email: '',
        phoneNumber: '000-000-0000',
        username: '',
        gender: 0,
        dateOfBirth: '2000-01-01',
        region: '',
        avatarUrl: '');
  }
}

class UploadAvatarResponseModel {
  final int? id;
  final String? imageUrl;

  const UploadAvatarResponseModel({this.id, this.imageUrl});

  factory UploadAvatarResponseModel.fromJson(Map<String, dynamic> json) {
    return UploadAvatarResponseModel(
        id: json['id'], imageUrl: json['image_url']);
  }
}

class ProfileModel {
  final int? id;
  final String? userId;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? username;
  final int? gender;
  final String? dateOfBirth;
  final String? region;

  const ProfileModel(
      {this.id,
      this.userId,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.username,
      this.gender,
      this.dateOfBirth,
      this.region});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        id: json['id'],
        userId: json['user_id'],
        fullName: json['full_name'],
        email: json['email'],
        phoneNumber: json['phone_number'],
        username: json['username'],
        gender: json['gender'],
        dateOfBirth: json['date_of_birth'],
        region: json['region']);
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
      'region': region
    };
  }

  static ProfileModel initState() {
    return const ProfileModel(
        id: 0,
        userId: '',
        fullName: '',
        email: '',
        phoneNumber: '000-000-0000',
        username: '',
        gender: 0,
        dateOfBirth: '2000-01-01',
        region: '');
  }
}

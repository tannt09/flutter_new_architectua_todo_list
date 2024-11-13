class ProfileModel {
  final int? id;
  final String? userId;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? username;
  final String? gender;
  final String? dateOfBirth;

  const ProfileModel(
      {this.id,
      this.userId,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.username,
      this.gender,
      this.dateOfBirth});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        id: json['id'],
        userId: json['user_id'],
        fullName: json['full_name'],
        email: json['email'],
        phoneNumber: json['phone_number'],
        username: json['username'],
        gender: json['gender'],
        dateOfBirth: json['date_of_birth']);
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
      'date_of_birth': dateOfBirth
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
      gender: 'Not Specified',
      dateOfBirth: '2000-01-01',
    );
  }
}

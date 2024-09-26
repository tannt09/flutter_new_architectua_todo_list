class AuthModel {
  final int? code;
  final String? message;
  final String? error;
  final AuthData? data;

  const AuthModel({this.code, this.message, this.data, this.error});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
        code: json['code'],
        message: json['message'],
        error: json['error'],
        data: json['data'] != null ? AuthData.fromJson(json['data']) : null);
  }
}

class AuthData {
  final String? token;
  final String? customer;

  const AuthData({this.token, this.customer});

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(token: json['token'], customer: json['customer']);
  }
}

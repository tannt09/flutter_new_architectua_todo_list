class LoginModel {
  final int? code;
  final String? message;
  final String? error;
  final LoginData? data;

  const LoginModel({this.code, this.message, this.data, this.error});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        code: json['code'],
        message: json['message'],
        error: json['error'],
        data: json['data'] != null ? LoginData.fromJson(json['data']) : null);
  }
}

class LoginData {
  final String? token;

  const LoginData({this.token});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      token: json['token'],
    );
  }
}

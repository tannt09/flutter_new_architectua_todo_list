class LoginModel {
  final String? message;
  final String? error;
  final String? token;

  const LoginModel({this.message, this.token, this.error});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        message: json['message'], error: json['error'], token: json['token']);
  }
}

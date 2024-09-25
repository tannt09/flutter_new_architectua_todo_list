class RegisterModel {
  final String? message;
  final String? error;
  final String? customer;

  const RegisterModel({this.message, this.customer, this.error});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
        message: json['message'],
        error: json['error'],
        customer: json['customer']);
  }
}

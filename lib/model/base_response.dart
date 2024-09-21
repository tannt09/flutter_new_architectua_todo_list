class BaseResponse {
  final String? message;
  final String? error;
  final String? customer;

  const BaseResponse({this.message, this.customer, this.error});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
        message: json['message'],
        error: json['error'],
        customer: json['customer']);
  }
}

class CheckoutPaymentModel {
  final int statusCode;
  final bool status;
  final String message;
  final Data data;

  CheckoutPaymentModel({
    required this.statusCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory CheckoutPaymentModel.fromJson(Map<String, dynamic> json) {
    return CheckoutPaymentModel(
      statusCode: json['statusCode'],
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final String transactionId;

  Data({required this.transactionId});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      transactionId: json['transaction_id'],
    );
  }
}

class OrderCancellationOrDeletionModel {
  final dynamic statusCode;
  final dynamic status;
  final String message;

  OrderCancellationOrDeletionModel({
    required this.statusCode,
    required this.status,
    required this.message,
  });

  factory OrderCancellationOrDeletionModel.fromJson(Map<String, dynamic> json) {
    return OrderCancellationOrDeletionModel(
      statusCode: json['statusCode'],
      status: json['status'],
      message: json['message'],
    );
  }
}

class CancelledOrDeletedOrderModel {
  final dynamic statusCode;
  final dynamic status;
  final String message;

  CancelledOrDeletedOrderModel({
    required this.statusCode,
    required this.status,
    required this.message,
  });

  factory CancelledOrDeletedOrderModel.fromJson(Map<String, dynamic> json) {
    return CancelledOrDeletedOrderModel(
      statusCode: json['statusCode'],
      status: json['status'],
      message: json['message'],
    );
  }
}

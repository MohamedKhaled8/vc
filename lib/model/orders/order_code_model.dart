class OrderCodeModel {
  final int statusCode;
  final bool status;
  final OrderCodeData data;

  OrderCodeModel({
    required this.statusCode,
    required this.status,
    required this.data,
  });

  factory OrderCodeModel.fromJson(Map<String, dynamic> json) {
    return OrderCodeModel(
      statusCode: json['statusCode'],
      status: json['status'],
      data: OrderCodeData.fromJson(json['Order Code ']),
    );
  }
}

class OrderCodeData {
  final String orderCode;

  OrderCodeData({required this.orderCode});

  factory OrderCodeData.fromJson(Map<String, dynamic> json) {
    return OrderCodeData(
      orderCode: json['order_code'],
    );
  }
}

class SubServiceModel {
  int? statusCode;
  bool? status;
  List<Data>? data = [];

  SubServiceModel({
    this.statusCode,
    this.status,
    this.data,
  });

  SubServiceModel.fromJson(json) {
    statusCode = json['statusCode'];
    status = json['status'];

    if (json['data'] != null) {
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  final int id;
  final String title;
  final int price;
  final int serviceId;
  final String createdAt;
  final String updatedAt;

  Data({
    required this.id,
    required this.title,
    required this.price,
    required this.serviceId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      serviceId: json['service_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

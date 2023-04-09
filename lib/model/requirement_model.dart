class RequriementModel {
  int? statusCode;
  bool? status;
  List<Data>? data = [];

  RequriementModel({this.statusCode, this.status, this.data});

  RequriementModel.fromJson(Map<String, dynamic> json) {
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
  final int requirementPrice;
  final int serviceId;
  final String createdAt;
  final String updatedAt;

  Data(
      {required this.id,
      required this.title,
      required this.requirementPrice,
      required this.serviceId,
      required this.createdAt,
      required this.updatedAt});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      title: json['title'],
      requirementPrice: json['requirement_price'],
      serviceId: json['service_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}


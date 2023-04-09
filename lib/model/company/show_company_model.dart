class ShowCompanyModel {
  final int statusCode;
  final bool status;
  final String message;
  final Data data;

  ShowCompanyModel(
      {required this.statusCode,
        required this.status,
        required this.message,
        required this.data});

  factory ShowCompanyModel.fromJson(Map<String, dynamic> json) {
    return ShowCompanyModel(
      statusCode: json['statusCode'],
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final int id;
  final String name;
  final String email;
  final String address;
  final String phone;
  final String photo;
  final String type;

  Data(
      {required this.id,
        required this.name,
        required this.email,
        required this.address,
        required this.phone,
        required this.photo,
        required this.type});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      photo: json['photo'],
      type: json['type'],
    );
  }
}
class AllCompanyModel {
  int? statusCode;
  bool ?status;
  List<Data>? data=[];

  AllCompanyModel(
      { this.statusCode,
        this.status,
        this.data});

  AllCompanyModel.fromJson(Map<String, dynamic> json) {
    statusCode= json['statusCode'];
    status= json['status'];
    if (json['data'] != null) {
       json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }
}

class Data {
  final int id;
  final String name;
  final String email;
  final String address;
  final int phone;
  final int companyId;
  final String photo;
  final String type;

  Data(
      {required this.id,
        required this.name,
        required this.email,
        required this.address,
        required this.phone,
        required this.companyId,
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
      companyId: json['companyId'],
      type: json['type'],
    );
  }
}
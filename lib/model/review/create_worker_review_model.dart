class AddWorkerReviewModel {
  final int statusCode;
  final bool status;
  final String message;
  final Data data;

  AddWorkerReviewModel({
    required this.statusCode,
    required this.message,
    required this.status,
    required this.data,
  });

  factory AddWorkerReviewModel.fromJson(Map<String,dynamic>json) {
    return AddWorkerReviewModel(
      statusCode: json['statusCode'],
      message: json['message'],
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  int? id;
  String? comments;
  String? rating;
  List<User>? user=[];
  String? workerId;

  Data({
    this.id,
    this.comments,
    this.rating,
    this.user,
    this.workerId,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id= json['id'];
    comments= json['comments'];
    rating= json['rating'];
    json['user'].forEach((v) {
      user!.add( User.fromJson(v));
    });

    workerId= json['worker_id'];
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String address;
  final int phone;
  final String photo;
  final int count;
  final String type;
  final int companyId;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
    required this.phone,
    required this.address,
    required this.type,
    required this.companyId,
    required this.count,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      photo: json['photo'],
      phone: json['phone'],
      count: json['count'],
      type: json['type'],
      companyId: json['companyId'],
    );
  }
}
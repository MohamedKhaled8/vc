class GetReviewModel {
  int ? statusCode;
  bool ?status;
  String? message;
  List< Data>? data = [];

  GetReviewModel({
    this.statusCode,
    this.message,
    this.status,
    this.data,
  });

  GetReviewModel.fromJson(Map<String,dynamic>json) {
    statusCode= json['statusCode'];
    message= json['message'];
    status= json['status'];

    if (json['data'] != null) {
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? comments;
  num? rating;
  List<User>? user=[];
  int? serviceId;

  Data({
    this.id,
    this.comments,
    this.rating,
    this.user,
    this.serviceId,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id= json['id'];
    comments= json['comments'];
    rating= json['rating'];
    if (json['user'] != null) {
      user= json['user'].forEach((v) {
        user!.add( User.fromJson(v));
      });
    }
    serviceId= json['service_id'];
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String photo;


  User({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      photo: json['photo'],

    );
  }
}
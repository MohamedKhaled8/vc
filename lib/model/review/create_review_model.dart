class ReviewModel {
  final dynamic statusCode;
  final dynamic status;
  final String message;
  final Data data;

  ReviewModel({
    required this.statusCode,
    required this.message,
    required this.status,
    required this.data,
  });

  factory ReviewModel.fromJson(Map<String,dynamic>json) {
    return ReviewModel(
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
  String? serviceId;

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
    json['user'].forEach((v) {
        user!.add( User.fromJson(v));
      });

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
class UpdateReviewWorkerModel {
  final int statusCode;
  final bool status;
  final String message;
  final Data data;

  UpdateReviewWorkerModel({
    required this.statusCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateReviewWorkerModel.fromJson(Map<String, dynamic> json) {
    return UpdateReviewWorkerModel(
      statusCode: json['statusCode'],
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  Data({
    required this.id,
    required this.comments,
    required this.rating,
    required this.user,
    required this.serviceId,
  });

  final int id;
  final String comments;
  final String rating;
  final List<User> user;
  final String serviceId;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      comments: json['comments'],
      rating: json['rating'],
      user: List.from(json['user']).map((e) => User.fromJson(e)).toList(),
      serviceId: json['service_id'],
    );
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String email;
  final String address;
  final int phone;
  final String createdAt;
  final String updatedAt;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id : json['id'],
        name : json['name'],
        email : json['email'],
    address : json['address'],
    phone : json['phone'],
    createdAt : json['created_at'],
    updatedAt : json['updated_at'],
    );
  }
}

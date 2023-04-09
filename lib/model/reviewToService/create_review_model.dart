class ReviewModel {
  final int statusCode;
  final bool status;
  final String message;
  final ReviewData data;

  ReviewModel({
    required this.statusCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory ReviewModel.fromJson(json) {
    return ReviewModel(
      statusCode: json['statusCode'],
      status: json['status'],
      message: json['message'],
      data: ReviewData.fromJson(json['data']),
    );
  }
}

class ReviewData {
  final int id;
  final String comments;
  final int rating;
  final List<User> user;
  final int serviceId;

  ReviewData({
    required this.id,
    required this.comments,
    required this.rating,
    required this.user,
    required this.serviceId,
  });

  factory ReviewData.fromJson(Map<String, dynamic> json) {
    return ReviewData(
      id: json['id'],
      comments: json['comments'],
      rating: json['rating'],
      user: List<User>.from(json['user'].map((userJson) => User.fromJson(userJson))),
      serviceId: json['service_id'],
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String address;
  final int phone;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

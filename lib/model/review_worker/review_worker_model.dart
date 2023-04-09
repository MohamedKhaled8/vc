class CreateReviewWorkerModel {
  final int statusCode;
  final bool status;
  final String message;
  final  ReviewData data;

  CreateReviewWorkerModel({
    required this.statusCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory CreateReviewWorkerModel.fromJson(Map<String, dynamic> json) {
    return CreateReviewWorkerModel(
      statusCode: json['statusCode'],
      status: json['status'],
      message: json['message'],
      data: ReviewData.fromJson(json['data']),
    );
  }
}

class ReviewData {
  final int id;
  final  String comments;
  final String rating;
  final List<User> user;
  final String workerId;

  ReviewData({
    required this.id,
    required this.comments,
    required this.rating,
    required this.user,
    required this.workerId,
  });

  factory ReviewData.fromJson(Map<String, dynamic> json) {
    return ReviewData(
      id: json['id'],
      comments: json['comments'],
      rating: json['rating'],
      user: List<User>.from(json['user'].map((user) => User.fromJson(user))),
      workerId: json['worker_id'],
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String address;
  final int phone;
  dynamic deviceToken;
  dynamic resetVerificationCode;
  String createdAt;
  String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.deviceToken,
    required this.resetVerificationCode,
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
      deviceToken: json['device_token'],
      resetVerificationCode: json['reset_verification_code'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

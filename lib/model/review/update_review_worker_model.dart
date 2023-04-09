class UpdateWorkerReviewModel {
  final int statusCode;
  final bool status;
  final String message;
  final Data data;

  UpdateWorkerReviewModel({
    required this.statusCode,
    required this.message,
    required this.status,
    required this.data,
  });

  factory UpdateWorkerReviewModel.fromJson(Map<String,dynamic>json) {
    return UpdateWorkerReviewModel(
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
   List<User>? user;
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
        if (json['user'] != null) {
      user = <User>[];
      user= json['user'].forEach((v) {
        user!.add( User.fromJson(v));
      });
    }
      workerId= json['worker_id'];
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String address;
  final int phone;


  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],

    );
  }
}

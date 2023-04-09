class TopServiceModel {
  int? statusCode;
  bool? status;
  List<Data>? data = [];

  TopServiceModel({
    this.statusCode,
    this.status,
    this.data,
  });

  TopServiceModel.fromJson(json) {
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
  int? id;
  String? title;
  String? description;
  int? price;
  int? categoryId;
  int? active;
  List<Workers>? workers = [];
  String? images;
  List<Review>? review = [];
  String? createdAt;
  String? updatedAt;
  bool? is_favorite;
  num? rate;
  Data({
    required this.id,
    this.title,
    this.description,
    required this.price,
    this.categoryId,
    this.active,
    this.workers,
    this.images,
    this.review,
    this.createdAt,
    this.updatedAt,
    required this.is_favorite,
    this.rate,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    categoryId = json['category_id'];
    active = json['active'];

    if (json['workers'] != null) {
      json['workers'].forEach((v) {
        workers!.add(Workers.fromJson(v));
      });
    }
    images = json['images'];

    if (json['Review'] != null) {
      json['Review'].forEach((v) {
        review!.add(Review.fromJson(v));
      });
    }

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    is_favorite = json['is_favorite'];
  }
}

class Workers {
  Workers({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.active,
    required this.count,
    required this.photo,
  });
  final int id;
  final String name;
  final String email;
  final String address;
  final int phone;
  final int active;
  final int count;
  final String photo;

  factory Workers.fromJson(Map<String, dynamic> json) {
    return Workers(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      active: json['active'],
      count: json['count'],
      photo: json['photo'],
    );
  }
}

class Pivot {
  final int serviceId;
  final int workId;

  Pivot({
    required this.serviceId,
    required this.workId,
  });

  factory Pivot.fromJson(json) {
    return Pivot(
      serviceId: json['service_id'],
      workId: json['worker_id'],
    );
  }
}

class Review {
  int? id;
  String? comments;
  late final num rating;
  int? serviceId;
  List<User>? user = [];

  Review({
    required this.id,
    required this.comments,
    required this.rating,
    required this.serviceId,
    required this.user,
  });
  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comments = json['comments'];
    rating = json['rating'];
    serviceId = json['service_id'];
    if (json['user'] != null) {
      json['user'].forEach((v) {
        user!.add(User.fromJson(v));
      });
    }
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? address;
  int? phone;
  int? approved;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.phone,
      this.createdAt,
      this.approved,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    approved = json['approved'];
    address = json['address'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

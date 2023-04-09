class FavoriteModel {
  final int statusCode;
  final bool status;
  final List<Data>? data;

  FavoriteModel({
    required this.statusCode,
    required this.status,
    this.data,
  });

  factory FavoriteModel.fromJson( json) {
    return FavoriteModel(
      statusCode: json['statusCode'],
      status: json['status'],
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => Data.fromJson(item))
          .toList(),
    );
  }
}

class Data {
  final int id;
  final List<Service>? service;

  Data({
    required this.id,
    this.service,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      service: (json['service'] as List<dynamic>?)
          ?.map((item) => Service.fromJson(item))
          .toList(),
    );
  }
}

class Service {
  final int id;
  final String title;
  final String description;
  final int price;
  final int categoryId;
  final int active;
  final List<Worker>? workers;
  final String images;
  final List<Review>? review;
  final String createdAt;
  final String updatedAt;

  Service({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.active,
   required  this.workers,
    required this.images,
    required this.review,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      categoryId: json['category_id'],
      active: json['active'],
      workers: (json['workers'] as List<dynamic>?)
          ?.map((item) => Worker.fromJson(item))
          .toList(),
      images: json['images'],
      review: (json['Review'] as List<dynamic>?)
          ?.map((item) => Review.fromJson(item))
          .toList(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Worker {
  final int id;
  final String name;
  final String email;
  final String address;
  final int phone;
  final int NIN;
  final int active;
  final String createdAt;
  final String updatedAt;

  Worker({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.NIN,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Worker.fromJson(Map<String, dynamic> json) {
    return Worker(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      NIN: json['NIN'],
      active: json['active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Review {
  final int id;
  final String comments;
  final int starRating;
  final int serviceId;
  final int userId;
  final String createdAt;
  final String updatedAt;

  Review({
    required this.id,
    required this.comments,
    required this.starRating,
    required this.serviceId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      comments: json['comments'],
      starRating: json['star_rating'],
      serviceId: json['service_id'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}


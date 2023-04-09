class ShowFavoriteModel {
  int? statusCode;
  bool? status;
  Data? data;

  ShowFavoriteModel({
    this.statusCode,
    this.status,
    this.data,
  });
  ShowFavoriteModel.fromJson(json) {
    statusCode=
    json['statusCode'];
    status= json['status'];
   data= Data.fromJson(json['data']);
    }
  }
class Data {
   int? id;
   List<Service>? service;

  Data({
     this.id,
    this.service,
  });

   Data.fromJson(Map<String, dynamic> json) {
      id= json['id'];
      if (json['service'] != null) {
        service = <Service>[];
        service= json['service'].forEach((v) {
          service!.add( Service.fromJson(v));
        });
      }

  }
}

class Service {
  Service({
    this.id,
    this.title,
    this.description,
    this.price,
    this.categoryId,
    this.active,
    this.worker,
    this.image,
    this.review,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? description;
  int? price;
  int? categoryId;
  int? active;
  List<Workers>? worker;
  String? image;
  List<Review>? review;
  String? createdAt;
  String? updatedAt;

  Service.fromJson(json) {

    id= json['id'];
    title= json['title'];
    description= json['description'];
    price= json['price'];
    categoryId= json['category_id'];
    active= json['active'];
    if (json['worker'] != null) {
      worker = <Workers>[];
      worker= json['worker'].forEach((v) {
        worker!.add( Workers.fromJson(v));
      });
    }
    if (json['review'] != null) {
      review = <Review>[];
      review= json['Review'].forEach((v) {
        review!.add( Review.fromJson(v));
      });
    }
    image= json['image'];
    createdAt= json['created_at'];
    updatedAt= json['updated_at'];

  }
}


class Workers {
  final int id;
  final String name;
  final String email;
  final String address;
  final int phone;
  final int NIN;
  final int active;
  final String createdAt;
  final String updatedAt;

  Workers({
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

  factory Workers.fromJson(Map<String, dynamic> json) {
    return Workers(
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
  final dynamic starRating;
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


class ServiceShowModel {
  final int statusCode;
  final bool status;
  final Data data;
  final num rate;

  ServiceShowModel({
   required  this.statusCode,
    required this.status,
    required this.data,
    required this.rate,
  });

  factory ServiceShowModel.fromJson(Map<String,dynamic> json) {
    return ServiceShowModel(
        statusCode: json['statusCode'],
        status: json['status'],
        data: Data.fromJson(json['data']),
        rate: json['rate'],);
  }
}

class Data {
   int? id;
   String? title;
   String? description;
   int? price;
   int? categoryId;
   int? active;
   List<Workers>? workers=[];
   String? images;
   List<Review>? review=[];
   String? createdAt;
   String? updatedAt;
  Data({
     this.id,
     this.title,
     this.description,
     this.price,
     this.categoryId,
     this.active,
     this.workers,
     this.images,
     this.review,
     this.createdAt,
     this.updatedAt,
  });

   Data.fromJson(Map<String, dynamic> json) {
      id= json['id'];
      title= json['title'];
      description= json['description'];
      price= json['price'];
      categoryId= json['category_id'];
      active= json['active'];
      if (json['workers'] != null) {
        json['workers'].forEach((v) {
          workers!.add(Workers.fromJson(v));
        });
      }
      images= json['images'];
      if (json['Review'] != null) {
    json['Review'].forEach((v) {
          review!.add(Review.fromJson(v));
        });
      }
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

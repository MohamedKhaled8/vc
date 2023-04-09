class UpdateOrderModel {
  final dynamic statusCode;
  final dynamic status;
  final Data data;

  UpdateOrderModel({
    required this.statusCode,
    required this.status,
    required this.data,
  });
  factory UpdateOrderModel.fromJson(Map<String,dynamic>json) {
  return UpdateOrderModel(
  statusCode: json['statusCode'],
  status: json['status'],
  data: Data.fromJson(json['data']),
  );
  }
}
class Data {
  Data({
    this.id,
    this.workArea,
    this.date,
    this.time,
    this.address,
    this.repeat,
    this.status,
    this.paymentStatus,
    this.service,
    this.totalPrice,
    this.orderCode,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? workArea;
  String? date;
  String? time;
  String? address;
  String? repeat;
  String? status;
  String? paymentStatus;
  List<Service>? service;
  String? totalPrice;
  String? orderCode;
  String? createdAt;
  String? updatedAt;

  Data.fromJson(json) {
    id = json['id'];
    workArea = json['worke_aera'];
    date = json['date'];
    time = json['time'];
    address = json['address'];
    repeat = json['repeat'];
    status = json['status'];
    paymentStatus = json['payment_status'];
    if (json['service'] != null) {
      service = <Service>[];
      service = json['service'].forEach((v) {
        service!.add(Service.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
    orderCode = json['order_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    categoryId = json['category_id'];
    active = json['active'];
    if (json['workers'] != null) {
      worker = <Workers>[];
      worker = json['workers'].forEach((v) {
        worker!.add(Workers.fromJson(v));
      });
    }
    if (json['review'] != null) {
      review = <Review>[];
      review = json['Review'].forEach((v) {
        review!.add(Review.fromJson(v));
      });
    }
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Workers {
  Workers({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.nin,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  final int id;
  final String name;
  final String email;
  final String address;
  final int phone;
  final int nin;
  final int active;
  final String createdAt;
  final String updatedAt;
  final Pivot pivot;

  factory Workers.fromJson(json) {
    return Workers(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      nin: json['NIN'],
      active: json['active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      pivot: Pivot.fromJson(json['pivot']),
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
  final int id;
  final String comments;
  final num starRating;
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
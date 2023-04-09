class AddOrderModel {
  int? statusCode;
  bool? status;
  Data? data;

  AddOrderModel({this.statusCode, this.status, this.data});

  AddOrderModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    data =  Data.fromJson(json['data']) ;

  }
}

class Data {
  int? id;
  String? workeAera;
  String? date;
  String? time;
  String? address;
  String? repeat;
  List<Service>? service=[];
  int? totalPrice;
  String? orderCode;
  List<SubService>? subService=[];
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.workeAera,
        this.date,
        this.time,
        this.address,
        this.repeat,
        this.service,
        this.totalPrice,
        this.orderCode,
        this.subService,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    workeAera = json['worke_aera'];
    date = json['date'];
    time = json['time'];
    address = json['address'];
    repeat = json['repeat'];
    if (json['service'] != null) {
      json['service'].forEach((v) {
        service!.add( Service.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
    orderCode = json['order_code'];
    if (json['subService'] != null) {
      json['subService'].forEach((v) {
        subService!.add( SubService.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

class Service {
  int? id;
  String? title;
  String? description;
  int? price;
  String? category;
  int? active;
  List<Workers>? workers;
  String? images;
  List<Review>? review;
  String? createdAt;
  String? updatedAt;

  Service(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.category,
        this.active,
        this.workers,
        this.images,
        this.review,
        this.createdAt,
        this.updatedAt});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    category = json['category'];
    active = json['active'];
    if (json['workers'] != null) {
      workers = <Workers>[];
      json['workers'].forEach((v) {
        workers!.add( Workers.fromJson(v));
      });
    }
    images = json['images'];
    if (json['Review'] != null) {
      review = <Review>[];
      json['Review'].forEach((v) {
        review!.add( Review.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

class Workers {
  int? id;
  String? name;
  String? email;
  String? address;
  int? phone;
  int? nIN;
  int? active;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Workers(
      {this.id,
        this.name,
        this.email,
        this.address,
        this.phone,
        this.nIN,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Workers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
    nIN = json['NIN'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot =  Pivot.fromJson(json['pivot']);
  }

}

class Pivot {
  int? serviceId;
  int? workerId;

  Pivot({this.serviceId, this.workerId});

  Pivot.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    workerId = json['worker_id'];
  }
}

class Review {
  int? id;
  String? comments;
  num? starRating;
  int? serviceId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Review(
      {this.id,
        this.comments,
        this.starRating,
        this.serviceId,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comments = json['comments'];
    starRating = json['star_rating'];
    serviceId = json['service_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

class SubService {
  int? id;
  String? title;
  int? price;
  int? serviceId;
  String? createdAt;
  String? updatedAt;

  SubService(
      {this.id,
        this.title,
        this.price,
        this.serviceId,
        this.createdAt,
        this.updatedAt});

  SubService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    serviceId = json['service_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

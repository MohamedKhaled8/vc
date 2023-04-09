class ShowCancelledOrderModel {
  ShowCancelledOrderModel({
    this.statusCode,
    this.status,
    this.cancelledOrder,
  });

  int? statusCode;
  bool? status;
  List<CanceledOrder>? cancelledOrder=[];

  ShowCancelledOrderModel.fromJson(json) {
    statusCode=
    json['statusCode'];
    status= json['status'];
    if (json['canceledOrder'] != null) {
      json['canceledOrder'].forEach((v) {
        cancelledOrder!.add( CanceledOrder.fromJson(v));
      });

    }
  }
}
class CanceledOrder {
  CanceledOrder({
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
    this.subService,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? workArea;
  String? date;
  String? time;
  String? address;
  String? repeat;
  String? status;
  String? paymentStatus;
  List<Service>? service=[];
  int? totalPrice;
  String? orderCode;
  List<SubService>? subService=[];
  String? createdAt;
  String? updatedAt;

  CanceledOrder.fromJson(json) {

    id= json['id'];
    workArea= json['worke_aera'];
    date= json['date'];
    time= json['time'];
    address= json['address'];
    repeat= json['repeat'];
    status= json['status'];
    paymentStatus= json['payment_status'];
    if (json['service'] != null) {
      json['service'].forEach((v) {
        service!.add( Service.fromJson(v));
      });
    }
    totalPrice= json['total_price'];
    orderCode= json['order_code'];
    if (json['subService'] != null) {
      json['subService'].forEach((v) {
        subService!.add( SubService.fromJson(v));
      });
    }
    createdAt= json['created_at'];
    updatedAt= json['updated_at'];
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
  List<Workers>? worker=[];
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
      json['worker'].forEach((v) {
        worker!.add( Workers.fromJson(v));
      });
    }
    if (json['review'] != null) {
      json['Review'].forEach((v) {
        review!.add( Review.fromJson(v));
      });
    }
    image= json['image'];
    createdAt= json['created_at'];
    updatedAt= json['updated_at'];

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
    );
  }
}

class Review {
   int? id;
   String? comments;
   dynamic starRating;
   int? serviceId;
   List<User>? user=[];

  Review({
     this.id,
     this.comments,
     this.starRating,
     this.serviceId,
     this.user,

  });

   Review.fromJson(Map<String, dynamic> json) {
      id= json['id'];
      comments= json['comments'];
      starRating= json['star_rating'];
      serviceId= json['service_id'];
      user= json['user'];
        if (json['user'] != null) {
      json['user'].forEach((v) {
        user!.add( User.fromJson(v));
      });
    }

  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String photo;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
  });



  factory User.fromJson(json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      photo: json['photo'],
    );
  }
}
class SubService {
  SubService({
    required this.serviceId,
    required this.id,
    required this.title,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final int price;
  final int serviceId;
  final String createdAt;
  final String updatedAt;

  factory SubService.fromJson(json) {
    return SubService(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      serviceId: json['service_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

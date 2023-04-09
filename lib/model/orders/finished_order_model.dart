class FinishedOrderModel {

  int? statusCode;
  bool? status;
  List<FinishedOrder>? finishedOrder=[];
  FinishedOrderModel({
    this.statusCode,
    this.status,
    this.finishedOrder,
  });
  FinishedOrderModel.fromJson(json) {
    statusCode=
    json['statusCode'];
    status= json['status'];
 json['finishedOrder'].forEach((v) {
      finishedOrder!.add( FinishedOrder.fromJson(v));
    });
  }
}
class FinishedOrder {
  FinishedOrder({
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

  FinishedOrder.fromJson(json) {

    id= json['id'];
    workArea= json['worke_aera'];
    date= json['date'];
    time= json['time'];
    address= json['address'];
    repeat= json['repeat'];
    status= json['status'];
    paymentStatus= json['payment_status'];
      json['service'].forEach((v) {
        service!.add( Service.fromJson(v));
      });

    totalPrice= json['total_price'];
    orderCode= json['order_code'];

      json['subService'].forEach((v) {
        subService!.add( SubService.fromJson(v));
      });
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
    this.workers,
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
  List<Workers>? workers=[];
  String? image;
  List<Review>? review=[];
  String? createdAt;
  String? updatedAt;

  Service.fromJson(json) {

    id= json['id'];
    title= json['title'];
    description= json['description'];
    price= json['price'];
    categoryId= json['category_id'];
    active= json['active'];
    json['workers'].forEach((v) {
        workers!.add( Workers.fromJson(v));
      });

    if (json['review'] != null) {
      json['review'].forEach((v) {
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
    required this.active,

    // required this.pivot,
  });

  final int id;
  final String name;
  final String email;
  final String address;
  final int phone;
  final int active;
  // final Pivot pivot;

  factory Workers.fromJson(json) {
    return Workers(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      active: json['active'],

      // pivot:Pivot.fromJson(json['pivot']
      // ),
    );
  }
}

// class Pivot {
//   final int serviceId;
//   final int workId;
//
//   Pivot({
//     required this.serviceId,
//     required this.workId,
//   });
//
//   factory Pivot.fromJson(json) {
//     return Pivot(
//       serviceId: json['service_id'],
//       workId: json['worker_id'],
//     );
//   }
// }
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
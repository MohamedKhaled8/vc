class UserHomeModel {
  List<Announcement>? announcement = [];
  List<Service>? service = [];
  List<Categories>? categories = [];
  UserHomeModel({
    this.announcement,
    this.service,
    this.categories,
  });
  UserHomeModel.fromJson(Map<String, dynamic> json) {
    if (json['announcement'] != null) {
      json['announcement'].forEach((v) {
        announcement!.add(Announcement.fromJson(v));
      });
    }

    if (json['Service'] != null) {
      json['Service'].forEach((v) {
        service!.add(Service.fromJson(v));
      });
      // service!.add(Service.fromJson(json['Service']));
    }

    if (json['categories'] != null) {
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }
}

class Announcement {
  Announcement({
    required this.id,
    required this.title,
    required this.photo,
  });
  final int id;
  final String title;
  final String photo;

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      id: json['id'],
      title: json['title'],
      photo: json['photo'],
    );
  }
}

class Service {
  int? id;
  String? title;
  String? description;
  int? price;
  String? category;
  int? active;
  List<Workers>? workers = [];
  String? images;
  List<Review>? review = [];
  String? createdAt;
  String? updatedAt;
  num? rate;
  bool? is_favorite;

  Service({
    this.id,
    this.title,
    this.description,
    this.price,
    this.category,
    this.active,
    this.workers,
    this.images,
    this.review,
    this.createdAt,
    this.updatedAt,
    this.is_favorite,
    this.rate,
  });

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    category = json['category'];
    active = json['active'];
    rate = json['rate'];
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
    required this.nin,
    required this.active,
    required this.count,
    required this.photo,
  });
  final int id;
  final String name;
  final String email;
  final String address;
  final int phone;
  final int nin;
  final int active;
  final int count;
  final String photo;

  factory Workers.fromJson(Map<String, dynamic> json) {
    return Workers(
      id: json['id'] ?? 0,
      name: json['name'],
      email: json['email'],
      address: json['address'] ?? '',
      phone: json['phone'] ?? 0,
      nin: json['NIN'] ?? 0,
      active: json['active'] ?? 0,
      count: json['count'] ?? 0,
      photo: json['photo'],
    );
  }
}

class Pivot {
  Pivot({
    required this.serviceId,
    required this.workerId,
  });

  final int serviceId;
  final int workerId;

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      serviceId: json['service_id'],
      workerId: json['worker_id'],
    );
  }
}

class Review {
  Review({this.id, this.comments, this.rating, this.user, this.serviceId});
  int? id;
  String? comments;
  dynamic rating;
  List<User>? user = [];
  int? serviceId;

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comments = json['comments'];
    rating = json['rating'];
    if (json['user'] != null) {
      json['user'].forEach((v) {
        user!.add(User.fromJson(v));
      });
    }
    serviceId = json['service_id'];
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? photo;

  User({this.id, this.name, this.email, this.photo});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
  }
}

class Categories {
  Categories({
    required this.id,
    required this.title,
    required this.images,
  });
  final int id;
  final String title;
  final String images;

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'],
      title: json['title'],
      images: json['images'],
    );
  }
}

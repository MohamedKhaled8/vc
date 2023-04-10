class NotificationModel {
  int? statusCode;
  bool? status;
  List<Data>? data = [];

  NotificationModel({this.statusCode, this.status, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
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
  String? body;
  int? userId;
  bool? isRead;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.title,
      this.body,
      this.userId,
      this.isRead,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    userId = json['user_id'];
    isRead = json['is_read'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

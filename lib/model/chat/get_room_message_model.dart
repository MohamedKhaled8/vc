class GetRoomMessageModel {
   String? message;
   int? status;
   int? statusCode;
   List<Data>? data = [];

  GetRoomMessageModel({
    required this.message,
    required this.status,
    required this.statusCode,
    required this.data,
  });
   GetRoomMessageModel.fromJson(Map<String, dynamic> json) {
      statusCode: json['statusCode'];
      status= json['status'];
      message= json['message'];
        if (json['data'] != null) {
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }
}

class Data {
  final int id;
  final String seenAt;
  final int senderId;
  final int roomId;
  final String message;
  final String createdAt;
  final String updatedAt;
   List media=[];

  Data(
      {required this.id,
        required this.senderId,
        required this.seenAt,
        required this.message,
        required this.roomId,
        required this.createdAt,
        required this.updatedAt,
        required this.media,
      });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id:json['id'],
      media:json['media'],
      seenAt: json['seen_at'],
      senderId: json['sender_id'],
      message: json['message'],
      roomId: json['room_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
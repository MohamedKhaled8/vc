class LatestMessageModel {
  final String message;
  final int status;
  final Data data;

  LatestMessageModel({
    required this.message,
    required this.status,
    required this.data,
  });
  factory LatestMessageModel.fromJson(Map<String, dynamic> json) {
    return LatestMessageModel(
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  Data({
    required this.latest,
    required this.unread,
  });

final  Latest latest;
 final int unread;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    latest: Latest.fromJson(json["latest"]),
    unread: json["unread"],
  );

}

class Latest {
  final int id;
  final String seenAt;
  final int senderId;
  final int roomId;
  final String message;
  final String createdAt;
  final String updatedAt;

  Latest(
      {required this.id,
        required this.senderId,
        required this.seenAt,
        required this.message,
        required this.roomId,
        required this.createdAt,
        required this.updatedAt});

  factory Latest.fromJson(Map<String, dynamic> json) {
    return Latest(
      id: json['id'],
      seenAt: json['seen_at'],
      senderId: json['sender_id'],
      message: json['message'],
      roomId: json['room_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
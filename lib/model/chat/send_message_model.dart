class SendMessageModel {
  final String message;
  final int status;
  final int statusCode;
  final Data data;

  SendMessageModel({
    required this.message,
    required this.status,
    required this.statusCode,
    required this.data,
  });
  factory SendMessageModel.fromJson(Map<String, dynamic> json) {
    return SendMessageModel(
      statusCode: json['statusCode'],
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final int id;
  final String roomId;
  final int senderId;
  final String message;
  final String createdAt;
  final String updatedAt;

  Data(
      {required this.id,
        required this.senderId,
        required this.roomId,
        required this.message,
        required this.createdAt,
        required this.updatedAt});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      roomId: json['room_id'],
      senderId: json['sender_id'],
      message: json['message'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
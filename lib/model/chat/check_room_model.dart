class CheckRoomModel {
  Latest? data;
  String? message;
  int? status;
  int? unRead;
  int? room;

  CheckRoomModel({this.data, this.message, this.status,this.unRead,this.room});

  CheckRoomModel.fromJson(Map<String, dynamic> json) {
    data = Latest.fromJson(json['data']['latest']);
    message = json['message'];
    status = json['status'];
    room = json['data']['room'][0]['id'];
    unRead = json['data']['unRead'];
  }
}

// class Data {
//   Latest? latest;
//   int? unRead;
//   List<Room>? room = [];
//
//   Data({this.latest, this.unRead, this.room});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     latest = Latest.fromJson(json['latest']);
//     unRead = json['unRead'];
//     if (json['room'] != null) {
//       json['room'].forEach((v) {
//         room!.add(Room.fromJson(v));
//       });
//     }
//   }
// }

class Latest {
  final int id;
  final String message;
  final String seenAt;
  final int senderId;
  final int roomId;
  final String createdAt;
  final String updatedAt;

  Latest({
    required this.id,
    required this.message,
    required this.seenAt,
    required this.senderId,
    required this.roomId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Latest.fromJson(Map<String, dynamic> json) {
    return Latest(
      id: json['id'],
      message: json['message'],
      seenAt: json['seen_at'],
      senderId: json['sender_id'],
      roomId: json['room_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Room {
  int id;

  Room({
    required this.id,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
    );
  }
}

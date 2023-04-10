import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/helper/caching_data.dart';
import 'package:vc/model/chat/check_room_model.dart';
import 'package:vc/model/chat/get_room_message_model.dart';
import 'package:vc/model/chat/latest_message_model.dart';
import 'package:vc/model/chat/send_message_model.dart';
import 'package:vc/services/chat/check_room_service.dart';
import 'package:vc/services/chat/get_room_message_service.dart';
import 'package:vc/services/chat/latest_message_service.dart';
import 'package:vc/services/chat/send_message_services.dart';

class ChatController extends GetxController {
  Future<String> getToken() async {
    final token = await CachingData.cachingLoginData();
    return token.token;
  }

  Future<SendMessageModel?> sendMessage({
    required String message,
    required String roomId,
    required BuildContext context,
  }) async {
    final data = await SendMessageService().sendMessage(
      body: {
        'room_id': roomId,
        'message': message,
      },
      token: await getToken(),
    );
    if (data['status'] == 201) {
      return SendMessageModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }

  Future<LatestMessageModel?> latestMessage({
    required String roomId,
    required BuildContext context,
  }) async {
    final data = await LatestMessageService().latestMessage(
      body: {
        'id': roomId,
      },
      token: await getToken(),
    );
    if (data['message'] != null && data['status'] == 200 ) {
      return LatestMessageModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar( const SnackBar(content: Text('no chat yet')));
    }
  }

  Future<GetRoomMessageModel?> getRoomMessage({
    required String id,
    required BuildContext context,
  }) async {
    final data = await GetRoomMessageService().getRoomMessage(
      body: {
        'id': id,
      },
      token: await getToken(),
    );
    if (data['statusCode'] == 201) {
      return GetRoomMessageModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }
  Future<CheckRoomModel?> checkRoomMessage({
    required String userId,
    required BuildContext context,
  }) async {
    final data = await CheckRoomMessageService().checkRoom(
      body: {
        'user_2': userId,
      },
      token: await getToken(),
    );
    if (data['message'] == 'Success') {
      print(data);
      return CheckRoomModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('No Room')));
    }
  }
}
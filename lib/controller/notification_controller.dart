import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/helper/caching_data.dart';
import '../model/notification_model.dart';
import '../services/notification_service.dart';

class NotificationController extends GetxController {
  Future<String> getToken() async {
    final userData = await CachingData.cachingLoginData();
    return userData.token;
  }

  Future<NotificationModel?> notification({
    required BuildContext context,
    required String url,
  }) async {
    final data = await NotificationService().notification(token: await getToken(),url:url);
    if (data['status'] != null && data['statusCode'] == 200) {
      return NotificationModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('No Notifications Yet')));
    }
  }
}

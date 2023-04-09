import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/services/auth/forget_password_service.dart';
import '../../services/auth/change_passsword_service.dart';

class ChangePasswordController extends GetxController {
  Future<dynamic> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    final data = await ForgetPasswordService().forgetPassword(body: {
      'current_password': oldPassword,
      'new_password': newPassword,
      'new_password_confirmation': confirmPassword,
    });
    if (data['statusCode'] != null && data['statusCode'] == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('email created successfully!')));

      return true;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
      return false;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/services/auth/rest_password_service.dart';

class RestPasswordController extends GetxController {
  Future<dynamic> restPassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    final data = await RestPasswordService().restPassword(body: {
      'email': email,
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

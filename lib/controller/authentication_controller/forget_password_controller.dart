import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/services/auth/forget_password_service.dart';

class ForgetPasswordController extends GetxController {
  Future<dynamic> forgetPassword(
      {required String email, required BuildContext context}) async {
    final data = await ForgetPasswordService().forgetPassword(
      body: {
        'email': email,
      },
    );
    if (data['status']) {
      return true;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
      return false;
    }
  }
}

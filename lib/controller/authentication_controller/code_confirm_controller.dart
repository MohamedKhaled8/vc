import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/services/auth/check_verify_code_service.dart';

class CodeConfirmController extends GetxController {
  Future<dynamic> checkCode({
    required BuildContext context,
    required String email,
    required String code,
  }) async {
    final data = await CodeConfirmService().codeConfirm(
      body: {
        'email': email,
        'code': code,
      },
    );
    if (data['status']) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('code successfully')));
      return true;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
      return false;
    }
  }
}

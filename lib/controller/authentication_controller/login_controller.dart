import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/helper/secure_storage.dart';
import 'package:vc/services/auth/login_service.dart';

import '../../model/auth/login_model.dart';

class LoginController extends GetxController {
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  var isPasswordHidden = true.obs;
  bool isCheckBox = false;
  var counter = 0.obs;

  LoginModel? loginData;

  Future<LoginModel?> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final data = await LoginService().login(
      body: {
        'email': email,
        'password': password,
        // 'devise_token': '',
      },
    );
    if (data['success'] != null && data['success']) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('login successfully!')));
      loginData = LoginModel.fromJson(data);
      await Secure_Storage.clearData();
      await Secure_Storage.setData(
          key: 'userLoginData', value: jsonEncode(data));
      return loginData;
    } else {
      if (data['message'] != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data['message'])));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data['error'])));
      }
    }
  }
}

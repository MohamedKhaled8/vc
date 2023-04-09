import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/model/auth/login_model.dart';
import 'package:vc/services/auth/login_service.dart';

class AuthController extends GetxController {
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  // final TextEditingController nameCont = TextEditingController();
  // final TextEditingController addressCont = TextEditingController();
  // final TextEditingController phonrCont = TextEditingController();
  LoginModel? dataOfUser;

  var isPasswordHidden = true.obs;
  bool isCheckBox = false;
  var counter = 0.obs;

  void isCheckBoxx() {
    isCheckBox = !isCheckBox;
    update();
  }

  // Future<bool> login({required String email, required String password}) async {
  //   final data = await LoginService(
  //     body: {'email': email, 'password': password},
  //   ).postData();
  //   if (data != '404') {
  //     dataOfUser = LoginModel.fromJson(data);
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}

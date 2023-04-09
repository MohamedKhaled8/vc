import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/auth/register_model.dart';
import '../../services/auth/register_service.dart';

class RegisterController extends GetxController {
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController addressCont = TextEditingController();
  final TextEditingController phoneCont = TextEditingController();
  bool userAccount = false;
  bool companyAccount = true;
  RegisterModel? signUpData;
  String groupValue = 'company';

  Future<bool?> register({
    required BuildContext context,
    required String name,
    required String email,
    required String address,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    final data = await RegisterService(
      body: {
        'name': name,
        'email': email,
        'address': address,
        'phone': phone,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    ).register();
    if (data['statusCode'] != null && data['statusCode'] == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('email created successfully!')));
      signUpData = RegisterModel.fromJson(data);
      return true;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
      return false;
    }
  }

  checkAccountType({required String selectedAccount}) {
    if (selectedAccount == 'company') {
      companyAccount = true;
      userAccount = false;
      groupValue = 'company';
    } else {
      userAccount = true;
      companyAccount = false;
      groupValue = 'user';
    }
    update();
  }
}

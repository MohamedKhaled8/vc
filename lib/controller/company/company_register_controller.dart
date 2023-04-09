import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/model/company/company_register_model.dart';
import 'package:vc/services/company/company_register_service.dart';


class CompanyRegisterController extends GetxController {


  CompanyRegisterModel? registerModel;
  Future<bool?> companyRegister({
    required BuildContext context,
    required String name,
    required String email,
    required String address,
    required String phone,
    required String password,
    required String passwordConfirmation,
    required String companyId,
  }) async {
    final data = await CompanyRegisterService(
    ).companyRegister( body: {
    'name': name,
    'email': email,
    'address': address,
    'phone': phone,
    'password': password,
    'password_confirmation': passwordConfirmation,
    'companyId': companyId,
    },);
    if (data['statusCode'] != null && data['statusCode'] == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('email created successfully!')));
      registerModel = CompanyRegisterModel.fromJson(data);
      return true;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
      return false;
    }
  }
}

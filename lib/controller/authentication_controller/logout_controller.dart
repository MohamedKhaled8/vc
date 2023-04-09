import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vc/services/auth/logout_service.dart';

import '../../helper/caching_data.dart';

class LogoutController extends GetxController {
  Future<String> getToken() async {
    final token = await CachingData.cachingLoginData();
    return token.token;
  }
  Future<dynamic> logout(
      { required BuildContext context}) async {
    final data = await LogoutService().logout(
      token: await getToken(),
    );
    if (data['status']=='success' && data['message']!= null) {
      ScaffoldMessenger.of(context)
          .showSnackBar( SnackBar(content:Text( data['message'])));
      return true;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content:Text(data['error'])));
      return false;

    }
  }
}

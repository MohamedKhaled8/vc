import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/model/auth/update_profile_model.dart';
import 'package:vc/services/auth/update_profile_service.dart';

import '../../helper/caching_data.dart';

class UpdateProfileController extends GetxController {
  Future<String> getToken() async {
    final token = await CachingData.cachingLoginData();
    return token.token;
  }

  Future<dynamic> updateProfile({
    required String name,
    required String email,
    required String address,
    required String phone,
    required BuildContext context,
  }) async {
    final token = await CachingData.cachingLoginData();

    final data = await UpdateProfileService().updateProfile(body: {
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
    }, token: token.token);
    if (data['statusCode'] != null && data['statusCode'] == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Update Profile successfully!')));
      print(data['statusCode']);
      return UpdateProfileModel.fromJson(data: data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
      return false;
    }
  }
}

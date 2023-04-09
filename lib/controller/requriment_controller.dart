import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/model/requirement_model.dart';
import 'package:vc/services/requirement_service.dart';
import '../helper/caching_data.dart';

class RequrimentController extends GetxController{
  Future<String> getToken() async {
    final token = await CachingData.cachingLoginData();
    return token.token;
  }
  Future<RequriementModel?> requirement({required BuildContext context,required String id}) async {

    final data = await RequriementService().requiremnt(id: id, token: await getToken());
    if (data != null) {
      return RequriementModel.fromJson(data);


    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }
}
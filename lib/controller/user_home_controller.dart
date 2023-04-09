import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/helper/caching_data.dart';
import 'package:vc/helper/db_sh.dart';
import 'package:vc/model/auth/login_model.dart';
import 'package:vc/model/services_model/service_show_model.dart';
import 'package:vc/model/services_model/subService_model.dart';
import 'package:vc/model/services_model/top_service_model.dart';
import 'package:vc/model/services_model/user_home_model.dart';
import 'package:vc/services/userHomeService/service_show_service.dart';
import 'package:vc/services/userHomeService/subService_service.dart';
import 'package:vc/services/userHomeService/top_service_service.dart';
import 'package:vc/services/userHomeService/user_home_service.dart';

class UserHomeController extends GetxController {
  Future<String> getToken() async {
    final token = await CachingData.cachingLoginData();
    return token.token;
  }
  LoginModel? userData;
  TopServiceModel? topServiceList;
  UserHomeModel? allUserHomeData;
  Future<ServiceShowModel?> serviceShow(int id) async {
    final data = ServiceShow().serviceShow(id);
    return data;
  }

  Future<SubServiceModel?> subService({required BuildContext context,required String id}) async {
    final data = await SubService().subService(id:id, token: await getToken());
    if (data['statusCode'] != null && data['statusCode'] == 200) {
   return  SubServiceModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }


  Future<TopServiceModel?> topService({required BuildContext context}) async {
    final data = await TopService().topService(
      token: userData?.token ?? '',
    );
    if (data['statusCode'] != null && data['statusCode'] == 200) {
      topServiceList = TopServiceModel.fromJson(data);
      return topServiceList;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }

  Future<UserHomeModel?> userHome({required BuildContext context}) async {
    userData = await CachingData.cachingLoginData();
    final data =
        await UserHomeService().getUserHome(token: userData?.token ?? '');
    if (data['error'] == null && data['statusCode'] != 401) {
      await Shared_Preference.setData(
          key: 'userHomeData', value: jsonEncode(data));
      allUserHomeData = UserHomeModel.fromJson(data);
      return allUserHomeData;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['error'])));
    }
  }
}

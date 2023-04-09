import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/model/company/show_company_model.dart';
import 'package:vc/services/company/show_comoany_service.dart';

import '../../helper/caching_data.dart';
import '../../model/company/all_compaany_model.dart';

class GetCompanyController extends GetxController{

  Future<String> getToken() async {
    final token = await CachingData.cachingLoginData();
    return token.token;
  }
  Future<ShowCompanyModel?> getCompany({required BuildContext context,required int id}) async {

    final data = await ShowCompanyService().showCompany(id: id, token: await getToken());
    if (data != null) {
      return ShowCompanyModel.fromJson(data);

    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['status'])));
    }
  }
  Future<AllCompanyModel?> allCompany({required BuildContext context}) async {

    final data = await ShowCompanyService().allCompany( token: await getToken());
    if (data != null) {
      return AllCompanyModel.fromJson(data);

    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['status'])));
    }
  }
  }
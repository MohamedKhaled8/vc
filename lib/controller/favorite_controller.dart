import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/helper/caching_data.dart';
import 'package:vc/model/favorites/create_favorite_model.dart';
import 'package:vc/model/favorites/delete_favorite_model.dart';
import 'package:vc/model/favorites/show_favorite_model.dart';
import 'package:vc/services/favorites/add_favorite_service.dart';
import 'package:vc/services/favorites/delete_favorite_service.dart';
import 'package:vc/services/favorites/get_favorite_service.dart';
import 'package:vc/services/favorites/show_favorite_service.dart';

import '../model/favorites/favorite_model.dart';

class FavoriteController extends GetxController {
  Future<String> getToken() async {
    final token = await CachingData.cachingLoginData();
    return token.token;
  }
  Future<FavoriteModel?> getFavorite() async {
    final data = await GetFavoriteService().getFavorite();
    return FavoriteModel.fromJson(data);
  }

  addFavorite(String lang, {required String serviceId,required BuildContext context}) async {


    final data = await AddFavoriteService().addFavorite(
      body: {'service_id': serviceId},
      token:await getToken(),
    );
    if (data['statusCode'] != null && data['statusCode'] == 200) {
      return AddFavoriteModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }

  showFavorite({required int favId,required BuildContext context}) async {

    final data = await ShowFavoriteService()
        .showFavorite(token: await getToken(), favId: favId);
    if (data['statusCode'] != null && data['statusCode'] == 200) {
      return ShowFavoriteModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }

  deleteFavorite({required String id,required BuildContext context,}) async {
    final data = await DeleteFavoriteService()
        .deleteFavorite(token: await getToken(), id: id);
    if (data['statusCode'] != null && data['status'] == 200) {
      return DeleteFavoriteModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }
}

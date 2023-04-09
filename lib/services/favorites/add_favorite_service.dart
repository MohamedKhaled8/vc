import 'dart:convert';
import 'dart:developer';
import 'package:vc/helper/api.dart';
import 'package:vc/helper/db_sh.dart';
import 'package:vc/helper/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:vc/model/favorites/create_favorite_model.dart';

class AddFavoriteService {
  Future<dynamic> addFavorite(
      {required Map body, String? lang, required String token}) async {
    final data = await ApiService().post(
      url: EndPointName.CREATEFAVORITE,
      body: body,
      token: token,
    );
    return data;
  }
}

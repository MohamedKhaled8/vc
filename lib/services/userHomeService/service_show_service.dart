import 'dart:convert';
import 'dart:developer';
import 'package:vc/helper/db_sh.dart';
import 'package:vc/helper/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:vc/model/services_model/service_show_model.dart';

class ServiceShow {
  Future<ServiceShowModel> serviceShow(int id) async {
    final response = await http.get(Uri.parse('${EndPointName.SERVICESHOW}$id'),
        headers: {
          'Authorization': 'Bearer ${Shared_Preference.getData(key: 'token')}'
        });
    final responseBody = json.decode(response.body);
    log(response.body);
    return ServiceShowModel.fromJson(responseBody);
  }
}

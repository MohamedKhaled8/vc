import 'dart:convert';
import 'dart:developer';
import 'package:vc/helper/db_sh.dart';
import 'package:vc/helper/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:vc/model/orders/update_order_model.dart';
import '../../model/orders/order_model.dart';

class UpdateOrderService {
  final Map body;

  UpdateOrderService({
    required this.body,
  });

  Future<UpdateOrderModel> updateOrder(String lang, String id) async {
    final response =
        await http.post(Uri.parse('${EndPointName.UPDATEORDER}$id'),
            headers: {
              'Authorization':
                  'Bearer ${Shared_Preference.getData(key: 'token')}',
              'lang': lang,
              'Accept': 'application/json',
              'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: body);
    final responseBody = json.decode(response.body);
    log(response.body);
    return UpdateOrderModel.fromJson(responseBody);
  }
}

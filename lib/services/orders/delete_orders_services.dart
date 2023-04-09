import 'dart:convert';
import 'dart:developer';
import 'package:vc/helper/db_sh.dart';
import 'package:vc/helper/end_points.dart';
import 'package:http/http.dart' as http;
import 'package:vc/model/orders/cancel_delete_order_mode.dart';

class DeleteOrderService {
  final Map body;

  DeleteOrderService({
    required this.body,
  });

  Future<CancelledOrDeletedOrderModel> deleteOrder(int? id) async {
    final response =
        await http.delete(Uri.parse('${EndPointName.DELETEORDER}$id'),
            headers: {
              'Authorization':
                  'Bearer ${Shared_Preference.getData(key: 'token')}',
              'Accept': 'application/json',
              'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: body);
    final responseBody = json.decode(response.body);
    log(response.body);
    return CancelledOrDeletedOrderModel.fromJson(responseBody);
  }
}

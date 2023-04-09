import 'dart:convert';
import 'dart:developer';
import 'package:vc/helper/db_sh.dart';
import 'package:vc/helper/end_points.dart';
import 'package:http/http.dart' as http;

import '../../model/payment/checkout_payment_model.dart';

class CheckoutPaymentService {
  Future<dynamic> checkoutPayment({required Map<String, dynamic> body}) async {
    final response = await http.post(Uri.parse(EndPointName.CHECKOUTPAYMENT),
        headers: {
          'Authorization': 'Bearer ${Shared_Preference.getData(key: 'token')}',
        },
        body: body);
    final responseBody = json.decode(response.body);
    log(response.body);
    return CheckoutPaymentModel.fromJson(responseBody);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/helper/caching_data.dart';
import 'package:vc/model/payment/all_payment_mdel.dart';
import 'package:vc/model/payment/checkout_payment_model.dart';
import 'package:vc/services/payment/add_payment_card.dart';
import 'package:vc/services/payment/checkout_payment_service.dart';
import 'package:vc/services/payment/get_all_payment_service.dart';
import '../model/payment/add_card_model.dart';

class PaymentController extends GetxController {
  Future<String> getToken() async {
    final token = await CachingData.cachingLoginData();
    return token.token;
  }

  AllPaymentModel? allPaymentModel;
  Future<AddPaymentCardModel?> addPaymentCard({
    required BuildContext context,
    required String number,
    required String expMonth,
    required String expYear,
    required String cvc,
  }) async {
    final data = await AddPaymentCardService().addPaymentCard(
      body: {
        'number': number,
        'exp_month': expMonth,
        'exp_year': expYear,
        'cvc': cvc,
      },
      token: await getToken(),
    );
    if (data['statusCode'] != null && data['statusCode'] == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
      return AddPaymentCardModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }

  Future<CheckoutPaymentModel?> checkOutPayment({
    required BuildContext context,
    required String orderId,
    required String amount,
    required String customerId,
  }) async {
    final data = await CheckoutPaymentService().checkoutPayment(body: {
      'order_id': orderId,
      'amount': amount,
      'token': await getToken(),
      'customer_id': customerId,
    });
    if (data['statusCode'] != null && data['statusCode'] == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Payment successfully!')));
      return CheckoutPaymentModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }

  Future<AllPaymentModel?> allPayment() async {
    final data =
        await GetAllPaymentService().getAllPayment(token: await getToken());
    if (data['statusCode'] != null && data['statusCode'] == 200) {
      return AllPaymentModel.fromJson(data);
    }
  }
}

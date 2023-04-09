import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/model/orders/add_order_model.dart';
import 'package:vc/model/orders/cancel_delete_order_mode.dart';
import 'package:vc/model/orders/finished_order_model.dart';
import 'package:vc/model/orders/show_cancel_order_model.dart';
import 'package:vc/services/orders/add_order_service.dart';
import 'package:vc/services/orders/cancelled_order_service.dart';
import 'package:vc/services/orders/finished_order.dart';
import 'package:vc/services/orders/show_cancelled_order_service.dart';
import '../../helper/caching_data.dart';
import '../../model/orders/order_model.dart';
import '../../services/orders/get_order_service.dart';

class OrderController extends GetxController {
  Future<String> getToken() async {
    final token = await CachingData.cachingLoginData();
    return token.token;
  }

  Future<OrdersModel?> getOrder({required BuildContext context}) async {
    final data = await GetOrderService().getOrder(
      token: await getToken(),
    );
    if (data != null) {
      return OrdersModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }

  Future<dynamic> addOrder({
    required BuildContext context,
    required String workArea,
    required String date,
    required String time,
    required String address,
    required String repeat,
    required String serviceId,
    required List subService,
    required List images,
  }) async {
    final data = await AddOrderService().addOrder(
      body: {
        'work area': workArea,
        'date': date,
        'time': time,
        'address': address,
        'repeat': repeat,
        'service_id': serviceId,
        'subService': subService,
        'gallery': images,
      },
      lang: 'en',
      token: await getToken(),
    );
    if (data['statusCode'] != null && data['statusCode'] == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Order Created successfully!')));
      print(data['statusCode']);
      return AddOrderModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
      return false;
    }
  }

  bool btnCancelledState = false;
  Future<CancelledOrDeletedOrderModel?> cancellOrder(
      {required BuildContext context, required int id}) async {
    final data = await CancelledOrderService()
        .cancelledOrder(token: await getToken(), id: id);
    if (data != null) {
      print(data);
      return CancelledOrDeletedOrderModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }

  void cancelState() {
    if (btnCancelledState) {
      btnCancelledState = false;
    } else {
      btnCancelledState = true;
    }
  }

  Future<FinishedOrderModel?> finishOrder(
      {required BuildContext context}) async {
    final data = await FinishedOrderService().finishedOrder(
      token: await getToken(),
    );
    if (data != null) {
      print(data);
      return FinishedOrderModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }

  Future<ShowCancelledOrderModel?> showCancellOrder(
      {required BuildContext context}) async {
    final data = await ShowCancelledOrderService().showCancelledOrder(
      token: await getToken(),
    );
    if (data != null) {
      print(data);
      return ShowCancelledOrderModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }
}

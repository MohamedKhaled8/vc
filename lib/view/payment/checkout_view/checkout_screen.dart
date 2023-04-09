// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vc/model/order_model.dart';
import 'package:vc/view/payment/checkout_view/add_address_brn.dart';
import 'package:vc/view/payment/checkout_view/buttom_bar.dart';
import 'package:vc/view/payment/checkout_view/order_card.dart';
import 'package:vc/view/payment/checkout_view/order_price_Card.dart';
import 'package:vc/view/payment/checkout_view/top_stack_app_bar.dart';

import '../../../model/services_model/user_home_model.dart';

class CheckoutScreen extends StatelessWidget {
  final Widget? card;
  final Service? serviceModel;
  final Map? orderData;
  const CheckoutScreen({
    Key? key,
    this.card,
    this.serviceModel,
    this.orderData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderCardModel orderModel;
    ScreenUtil screenUtil = ScreenUtil();

    return Scaffold(
      body: Column(
        children: [
          TopStackAppBar(
            PriceOrderCard: orderData!,
            serviceModel: serviceModel!,
            card: card,
          ),
          const AddAddress_Btn(),
          Container(
            width: screenUtil.setWidth(340),
            margin: const EdgeInsets.only(top: 20, bottom: 25),
            child: PaymentOrderCard(
              serviceModel: serviceModel,
              orderModel: OrderCardModel(
                id: '',
                date: orderData?['orderDate'] ?? '',
                time: orderData?['orderTime'] ?? '',
                address: orderData?['address'] ?? '',
                orderState: 'in progress',
              ),
            ),
          ),
          PriceOrderCard(
            orderInfo: orderData!,
          ),
        ],
      ),
      bottomNavigationBar: const Buttom_Bar(),
    );
  }
}
//  String checkOrderNumberlength(int text) {
//     if (text.toString().length > 8) {
//       return "${text.toString().substring(0, 7)}...";
//     } else {
//       return text.toString();
//     }
//   }
// }

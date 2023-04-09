import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/controller/user_home_controller.dart';
import 'package:vc/model/order_model.dart';
import 'package:vc/model/orders/order_model.dart';
import '../../../theme/constant/const_colors.dart';
import '../../../theme/constant/sized.dart';
import '../../service_form/service_form_screen.dart';
import '../order_details_screen.dart';

import '../../../model/services_model/user_home_model.dart';

class PaymentOrderCard extends StatelessWidget {
  final OrderCardModel orderModel;
  final Service? serviceModel;
  const PaymentOrderCard(
      {super.key, required this.orderModel, this.serviceModel});

  @override
  Widget build(BuildContext context) {
    final UserHomeController _homeController = UserHomeController();
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.only(top: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)),
        boxShadow: [
          BoxShadow(
              color: Color(0x33000000),
              offset: Offset(0, 0),
              blurRadius: 8,
              spreadRadius: 0)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Order# ${checkOrderNumberlength(orderModel.id)}",
                  style: TextStyle(fontSize: 18, color: ColorApp.primary),
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenUtil.setHeight(13),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 13, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text(
                      "Date : ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      orderModel.date,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Time :",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      orderModel.time,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(8),
          ),
          ListTile(
            title: const Text(
              "Address",
              style: TextStyle(color: Colors.grey),
            ),
            subtitle: Text(
              orderModel.address,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.to(
                    () => OrderDetailsScreen(orderInfo: Data(id: 1)),
                    transition: Transition.zoom,
                    duration: const Duration(milliseconds: 1000),
                  );
                },
                child: IntrinsicWidth(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 31, vertical: 13),
                    decoration: BoxDecoration(
                      color: ColorApp.primary,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15)),
                    ),
                    child: const Center(
                      child: Text(
                        'See All Details',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(
                    () => ServiceFormScreen(
                      serviceModel: serviceModel,
                    ),
                    transition: Transition.zoom,
                    duration: const Duration(milliseconds: 1000),
                  );
                },
                child: IntrinsicWidth(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70.5, vertical: 13),
                    // width: screenUtil.screenWidth / 2 - 20,
                    decoration: BoxDecoration(
                      color: orderModel.orderState == "NotFinished"
                          ? Colors.blueAccent.withOpacity(0.2)
                          : const Color(0xff017BAB),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Edit',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String checkOrderNumberlength(text) {
  if (text.toString().length > 8) {
    return "${text.toString().substring(0, 7)}...";
  } else {
    return text.toString();
  }
}

Color? returnColor(String state) {
  if (state == "inPrograss") {
    return Colors.grey;
  } else if (state == "NotFinished") {
    return Colors.grey.withOpacity(0.1);
  }
}

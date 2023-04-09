import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/controller/order/order_controller.dart';
import 'package:vc/view/order_histroy/qr_scanner.dart';
import 'package:vc/view/rating/rate_experience.dart';
import 'package:vc/view/rating/rate_workers_one.dart';
import '../theme/constant/const_colors.dart';
import '../view/payment/order_details_screen.dart';

class CustomOrdersContainer extends StatelessWidget {
  final dynamic data;
  final OrderController _orderController = OrderController();

  CustomOrdersContainer({
    super.key,
    required this.screenUtil,
    required this.data,
  });

  final ScreenUtil screenUtil;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.only(
        top: 15,
      ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order# ${data.orderCode!}",
                  style: TextStyle(fontSize: 18, color: ColorApp.primary),
                ),
                data.status == "finished"
                    ? InkWell(
                        onTap: () {},
                        child: const Text(
                          "Details",
                          style:
                              TextStyle(color: Color(0xff017BAB), fontSize: 18),
                        ))
                    : InkWell(
                        onTap: () {
                          if (data.status != 'canceled') {
                            _orderController.cancellOrder(
                                context: context, id: data.id!);
                          }
                        },
                        child: Container(
                          height: screenUtil.setHeight(30),
                          width: screenUtil.setWidth(70),
                          decoration: BoxDecoration(
                              color: returnColor(data.status!, true),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: Text(
                              "Cancel",
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(10),
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
                      data.date!,
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
                      data.time!,
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
            height: screenUtil.setHeight(10),
          ),
          ListTile(
            title: const Text(
              "Address",
              style: TextStyle(color: Colors.grey),
            ),
            subtitle: Text(
              data.address!,
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
                  data.status == "finished"
                      ? data.service![0].workers!.length > 0
                          ? Get.to(
                              () => RateWorker(
                                    orderInfo: data,
                                  ),
                              transition: Transition.zoom,
                              duration: const Duration(milliseconds: 1000))
                          : Get.to(
                              () => RateExperience(
                                    orderInfo: data,
                                  ),
                              transition: Transition.zoom,
                              duration: const Duration(milliseconds: 1000))
                      : Get.to(
                          () => OrderDetailsScreen(
                                orderInfo: data,
                              ),
                          transition: Transition.zoom,
                          duration: const Duration(milliseconds: 1000));
                },
                child: Container(
                  height: screenUtil.setHeight(45),
                  width: screenUtil.setWidth(185),
                  decoration: BoxDecoration(
                    color: ColorApp.primary,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15)),
                  ),
                  child: Center(
                    child: Text(
                      data.status == "finished"
                          ? 'Rate Experience'
                          : 'See All Details',
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  data.status! == "finished" ? Get.to(() => QrScan()) : null;
                },
                child: Container(
                  height: screenUtil.setHeight(45),
                  width: screenUtil.setWidth(185),
                  decoration: BoxDecoration(
                    color: data.status == "canceled"
                        ? Colors.blueAccent.withOpacity(0.2)
                        : const Color(0xff017BAB),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        data.status == 'finished'
                            ? Image.asset("assets/icons/mode-portrait.png")
                            : const SizedBox(),
                        Center(
                          child: Text(
                            data.status == "finished"
                                ? 'Team Check'
                                : 'ReSchedule',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ],
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

  String checkOrderNumberlength(int text) {
    if (text.toString().length > 8) {
      return "${text.toString().substring(0, 7)}...";
    } else {
      return text.toString();
    }
  }
}

Color? returnColor(String state, bool btnState) {
  if (state == "processing") {
    return Colors.grey;
  } else if (state == "canceled") {
    return Colors.grey.withOpacity(0.1);
  }
}

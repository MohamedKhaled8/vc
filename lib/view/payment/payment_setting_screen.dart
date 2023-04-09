import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/controller/change_card_controller.dart';

import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/theme/constant/sized.dart';
import 'package:vc/view/payment/checkout_view/checkout_screen.dart';
import 'package:vc/widgets/container_shadow.dart';
import 'package:vc/widgets/credet_card.dart';

import '../../widgets/custom_containert_top_screen.dart';
import '../../widgets/cutom_buttom_two.dart';

class PaymentSettingScreen extends StatelessWidget {
  PaymentSettingScreen({Key? key}) : super(key: key);

  final controller = Get.put(ChangeCardController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF0F0F0),
        body: Column(
          children: [
            CustomContainerTopScreen(
                ontap: () {
                  Get.back();
                },
                text: "Payment Settings",
                screenUtil: screenUtil,
                size: 130),
            Expanded(
              child: ListView.builder(
                  itemCount: credetCard.length,
                  itemBuilder: (cotext, index) {
                    return Container(
                      width: screenUtil.setWidth(350),
                      height: screenUtil.setHeight(160),
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                      child: Column(
                        children: [
                          credetCard[index],
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: screenUtil.setHeight(43),
                              width: screenUtil.setWidth(400),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.8),
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Delete Card',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: screenUtil.setHeight(60),
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(0, 3),
                  spreadRadius: 3,
                  blurRadius: 5,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: CustomButtonTWo(
                screenUtil: screenUtil,
                color: ColorApp.primary,
                color1: Colors.white,
                txt: 'Add new Card',
                onTap: () {
                  Get.off(CheckoutScreen(
                    card: credetCard[controller.cardSelected],
                  ));
                }),
          ),
        ),
      ),
    );
  }
}

List<CredetCard> credetCard = [];

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/controller/change_card_controller.dart';
import 'package:vc/controller/payment_controller.dart';
import 'package:vc/model/payment/all_payment_mdel.dart';

import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/theme/constant/sized.dart';
import 'package:vc/view/payment/checkout_view/checkout_screen.dart';
import 'package:vc/widgets/credet_card.dart';

import '../../model/services_model/user_home_model.dart';
import '../../widgets/custom_containert_top_screen.dart';
import '../../widgets/cutom_buttom_two.dart';

class ChangeCardScreen extends StatelessWidget {
  final AllPaymentModel allPaymentModel;
  final Map PriceOrderCard;
  final Service serviceModel;
  ChangeCardScreen({
    Key? key,
    required this.allPaymentModel,
    required this.PriceOrderCard,
    required this.serviceModel,
  }) : super(key: key);

  final controller = Get.put(ChangeCardController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final PaymentController _paymentController = Get.put(PaymentController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF0F0F0),
        body: Column(
          children: [
            CustomContainerTopScreen(
                ontap: () {
                  Get.back();
                },
                text: "Change Card",
                screenUtil: screenUtil,
                size: 130),
            Expanded(
              child: ListView.builder(
                  itemCount: allPaymentModel.data!.length,
                  itemBuilder: (cotext, index) {
                    return InkWell(onTap: () {
                      controller.checkSelected(cardIndex: index, active: true);
                    }, child: GetBuilder<ChangeCardController>(
                      builder: (_) {
                        return Container(
                          width: screenUtil.setWidth(350),
                          height: screenUtil.setHeight(130),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: _.isSelected
                                ? _.cardSelected == index
                                    ? ColorApp.primary.withOpacity(0.3)
                                    : null
                                : Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                          ),
                          child: CredetCard(
                            paymentCard: allPaymentModel.data![index],
                          ),
                        );
                      },
                    ));
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
                txt: 'Select Card',
                onTap: () {
                  Get.off(CheckoutScreen(
                    serviceModel: serviceModel,
                    orderData: PriceOrderCard,
                    card: CredetCard(
                      paymentCard:
                          allPaymentModel.data![controller.cardSelected],
                    ),
                  ));
                }),
          ),
        ),
      ),
    );
  }
}

List<CredetCard> credetCard = [];

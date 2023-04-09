import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/controller/order/order_controller.dart';
import 'package:vc/controller/payment_method_controller.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/view/payment/checkout_view/checkout_screen.dart';
import 'package:vc/widgets/container_shadow.dart';
import 'package:vc/widgets/custom_text_next_button.dart';
import 'package:vc/widgets/popup.dart';

import '../../model/services_model/user_home_model.dart';
import '../../widgets/custom_containert_top_screen.dart';

class PaymentMethodScreen extends StatelessWidget {
  final Service serviceInfo;
  final Map orderData;
  const PaymentMethodScreen(
      {Key? key, required this.serviceInfo, required this.orderData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PaymentMethodController _controller =
        Get.put(PaymentMethodController());

    final OrderController _orderController = Get.put(OrderController());
    final ScreenUtil screenUtil = ScreenUtil();
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SizedBox(
            child: Column(
              children: [
                CustomContainerTopScreen(
                  ontap: () {
                    Get.back();
                  },
                  screenUtil: screenUtil,
                  text: 'payment methods',
                  size: 120,
                ),
                SizedBox(
                  height: screenUtil.setHeight(30),
                ),
                Expanded(
                    child: GetBuilder<PaymentMethodController>(
                  builder: (_) => InkWell(
                    onTap: () {
                      _controller.selectPatmentType(type: 'credit');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: _controller.credit
                              ? ColorApp.primary.withOpacity(0.5)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        height: screenUtil.setHeight(120),
                        width: size.width - 40,
                        margin: const EdgeInsets.all(7),
                        decoration: buildShadowContainer(
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: screenUtil.setWidth(50),
                                height: screenUtil.setHeight(70),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/cards.png'),
                                        fit: BoxFit.contain)),
                              ),
                              SizedBox(
                                height: screenUtil.setHeight(15),
                              ),
                              const Text(
                                'Credit /Debit Card',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
                SizedBox(
                  height: screenUtil.setHeight(50),
                ),
                Expanded(
                  child: GetBuilder<PaymentMethodController>(
                    builder: (_) => InkWell(
                      onTap: () {
                        _controller.selectPatmentType(type: 'recepit');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: _controller.recepit
                                ? ColorApp.primary.withOpacity(0.5)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          height: screenUtil.setHeight(120),
                          width: size.width - 40,
                          margin: const EdgeInsets.all(7),
                          decoration: buildShadowContainer(
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: screenUtil.setWidth(30),
                                  height: screenUtil.setHeight(50),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/icons/b2c.png'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                SizedBox(
                                  height: screenUtil.setHeight(15),
                                ),
                                const Text(
                                  'Recepit',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenUtil.setHeight(100),
                ),
                CustomTextNextButton(
                  totalPrice: orderData['totalPrice'].toString(),
                  onTap: () async {
                    if (_controller.recepit) {
                      await showDialog(
                        context: context,
                        builder: (context) => Container(
                          margin: const EdgeInsets.only(bottom: 150),
                          child: const PopUp(
                            titleFristChat: 'T',
                            titlePartTwo: 'HANKS',
                            image: 'assets/images/json/success_payment.json',
                            orderID: '165498753',
                            btnText: 'Done',
                          ),
                        ),
                      );
                    } else {
                      // final _orderData = await _orderController.addOrder(
                      //   context: context,
                      //   workArea: orderData['workArea'],
                      //   date: orderData['orderDate'],
                      //   time: orderData['orderTime'],
                      //   address: orderData['address'],
                      //   repeat: orderData['repeatService'],
                      //   serviceId: serviceInfo.id.toString(),
                      //   subService: orderData['extraService'],
                      //   images: orderData['orderImages'],
                      // );
                      // print(_orderData);
                      Get.to(
                        CheckoutScreen(
                          orderData: orderData,
                          serviceModel: serviceInfo,
                        ),
                        transition: Transition.leftToRight,
                        duration: const Duration(milliseconds: 1000),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

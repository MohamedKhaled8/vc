import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/controller/order/order_controller.dart';
import 'package:vc/model/orders/order_model.dart';
import 'package:vc/view/payment/bottom_bar.dart';
import 'package:vc/widgets/container_shadow.dart';
import 'package:vc/widgets/custom_containert_top_screen.dart';
import '../../theme/constant/const_colors.dart';

class OrderDetailsScreen extends StatelessWidget {
  final dynamic orderInfo;
  OrderDetailsScreen({Key? key, required this.orderInfo}) : super(key: key);

  final ScreenUtil screenUtil = ScreenUtil();
  final OrderController controller = OrderController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Stack(
              children: [
                CustomContainerTopScreen(
                  text: "Order Details",
                  screenUtil: screenUtil,
                  ontap: () {
                    Get.back();
                  },
                  size: 120,
                ),
              ],
            ),
            SizedBox(
              height: screenUtil.setHeight(15),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                    height: screenUtil.setHeight(460),
                    decoration: buildShadowContainer(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 32, horizontal: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Order code',
                                      style: TextStyle(
                                          color: ColorApp.primary,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 20.0),
                                      textAlign: TextAlign.center),
                                  Text(orderInfo.orderCode!,
                                      style: TextStyle(
                                          color: ColorApp.primary,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 20.0),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                              SizedBox(
                                height: screenUtil.setHeight(10),
                              ),
                              buildRowItem('Service name',
                                  orderInfo.orderService![0].title!),
                              SizedBox(
                                height: screenUtil.setHeight(10),
                              ),
                              buildRowItem('Date :', orderInfo.date!),
                              SizedBox(
                                height: screenUtil.setHeight(10),
                              ),
                              buildRowItem('time :', orderInfo.time!),
                              SizedBox(
                                height: screenUtil.setHeight(10),
                              ),
                              Column(
                                children: [
                                  buildRowItem('Address', orderInfo.address!),
                                ],
                              ),
                              SizedBox(
                                height: screenUtil.setHeight(10),
                              ),
                              buildRowItem('Repeat', orderInfo.repeat!),
                              SizedBox(
                                height: screenUtil.setHeight(10),
                              ),
                              buildRowItem('Rooms', '2 room'),
                              SizedBox(
                                height: screenUtil.setHeight(10),
                              ),
                              buildRowItem('Bathroom', '1 Bathroom'),
                              SizedBox(
                                height: screenUtil.setHeight(10),
                              ),
                              buildRowItem('Kitchen', '3 Kitchen'),
                              SizedBox(
                                height: screenUtil.setHeight(10),
                              ),
                              buildRowItem('Extra Service',
                                  'Window , dish washing , Cooking'),
                              SizedBox(
                                height: screenUtil.setHeight(10),
                              ),
                              buildRowItem('Workers', ''),
                              SizedBox(
                                height: screenUtil.setHeight(10),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                height: screenUtil.setHeight(52),
                                decoration: BoxDecoration(
                                    color: ColorApp.primary,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text('Total',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 20.0),
                                          textAlign: TextAlign.center),
                                      Text('260\$',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 18.0),
                                          textAlign: TextAlign.center),
                                    ],
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: OrderDetailesBottomNavigationBar(
        screenUtil: screenUtil,
        size: size,
        txt: 'Download as pdf',
      ),
    );
  }

  Widget buildRowItem(
    String txt1,
    String txt2,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          txt1,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const Spacer(),
        Text(
          txt2,
          maxLines: 1,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}

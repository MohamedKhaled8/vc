import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/view/payment/order_details_screen.dart';
import 'package:vc/widgets/main_button.dart';
import '../../theme/constant/const_colors.dart';
import '../../widgets/arrow_back_icons.dart';
import '../../widgets/custom_buttom.dart';
import '../../widgets/cutom_buttom_two.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height / 2 - 100,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: size.height / 2 - 180,
                decoration: BoxDecoration(
                  color: ColorApp.primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ArrowBackIcon(
                            color: Colors.white,
                            ontap: () {
                              Get.back();
                            }),
                        Text(
                          'Checkout',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(),
                        SizedBox(
                          width: screenUtil.setWidth(10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 30,
                right: 30,
                top: size.height / 3 - 140,
                child: Container(
                  width: size.width,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 3,
                        blurRadius: 3,
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: size.width - 90,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.yellow.shade700,
                          ),
                        ),
                      ),
                      CustomButtonTWo(
                        ontap: () {},
                        screenUtil: screenUtil,
                        txt: 'Change Card',
                        color: Colors.grey.withOpacity(0.3),
                        color1: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              width: size.width / 2,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: ColorApp.primary),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(0, 3),
                      spreadRadius: 3,
                      blurRadius: 5,
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: ColorApp.primary,
                      child: Icon(Icons.add),
                    ),
                    SizedBox(
                      width: screenUtil.setWidth(10),
                    ),
                    Expanded(
                        child: Text(
                      'Add Payment Card',
                      style: TextStyle(color: ColorApp.primary, fontSize: 14),
                    )),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(10),
          ),
          Expanded(
              child: Container(
            height: 130,
            width: size.width - 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 3),
                    spreadRadius: 3,
                    blurRadius: 5,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order details',
                    style: TextStyle(fontSize: 18, color: ColorApp.primary),
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(5),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'Date :',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            Text(
                              'September 21, 2023',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Time :',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            '01:30 pm',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(5),
                  ),
                  Text(
                    'Address :',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    '95, Opposite Arjun College, Kairav Plot, Township No. 21',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(10),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: CustomButtom(
                          text: 'See All Details',
                          color: ColorApp.primary,
                          screenUtil: screenUtil,
                          color1: Colors.white,
                          ontap: () {},
                        )),
                        SizedBox(
                          width: screenUtil.setWidth(10),
                        ),
                        Expanded(
                            child: CustomButtom(
                          text: 'Edit',
                          color: ColorApp.buttonBlue,
                          screenUtil: screenUtil,
                          color1: Colors.white,
                          ontap: () {},
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
          SizedBox(
            height: screenUtil.setHeight(10),
          ),
          Expanded(
            child: Container(
              height: 130,
              width: size.width - 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(0, 3),
                      spreadRadius: 3,
                      blurRadius: 5,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price Summary',
                      style: TextStyle(fontSize: 18, color: ColorApp.primary),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cleaning',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        Text(
                          '250 \$',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        Text(
                          '10 \$',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        Text(
                          '0 \$',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              child: MainButton(
                            text: 'See All Details',
                            color: ColorApp.primary,
                            screenUtil: screenUtil,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
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
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(10),
          ),
          Container(
            height: 50,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 3),
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
                  txt: 'Payment confirmation',ontap: (){Get.to(()=>OrderDetailsScreen());},),
            ),
          ),
        ],
      ),
    );
  }
}

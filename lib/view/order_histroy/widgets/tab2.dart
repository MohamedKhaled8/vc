import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/view/service_form/service_form_screen.dart';

import '../../../theme/constant/const_colors.dart';
import '../../../widgets/container_shadow.dart';
import '../../payment/order_details_screen.dart';

class Tab2Screen extends StatelessWidget {
  Tab2Screen({Key? key}) : super(key: key);
  final ScreenUtil screenUtil = ScreenUtil();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        20.ph,
        Container(
          height: screenUtil.setHeight(186.5),
          width: size.width - 20,
          decoration: buildShadowContainer(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order# 10805128',
                          style: TextStyle(fontSize: 18, color: ColorApp.primary),
                        ),
                        Container(
                          height: screenUtil.setHeight(20),
                          width: screenUtil.setWidth(70),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(child: Text('Cancel',style: TextStyle(fontSize: 12),),),
                        ),
                      ],
                    ),
                    10.ph,
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: const [
                              Text(
                                'Date :',
                                style:
                                TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              Text(
                                'September 21, 2023',
                                style: TextStyle(fontSize: 12),
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
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    10.ph,
                    const Text(
                      'Address :',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const Text(
                      '95, Opposite Arjun College, Kairav Plot, Township No. 21',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              10.ph,
              Row(
                children: [
                  Expanded(
                      child:InkWell(
                        onTap:(){
                          Get.to(()=>OrderDetailsScreen());
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: ColorApp.primary,
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10)),
                          ),
                          child: const Center(child: Text('See All Details',style: TextStyle(color: Colors.white,fontSize: 14),),),
                        ),
                      )),
                  2.pw,
                  Expanded(
                      child:InkWell(
                        onTap:(){
                          Get.to(()=>ServiceFormScreen());
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: ColorApp.buttonBlue,
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),),
                          ),
                          child: Center(child:Text('ReSchedule',style: TextStyle(color: Colors.white,fontSize: 14),),),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
        20.ph,
      ],
    );
  }
}

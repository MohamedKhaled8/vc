import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/widgets/container_shadow.dart';

import '../../theme/constant/const_colors.dart';
import '../../widgets/custom_appbar_two.dart';

import '../../widgets/cutom_buttom_two.dart';


class OrderDetailsScreen extends StatelessWidget {
   OrderDetailsScreen({Key? key}) : super(key: key);

  final  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppBarOne(110, text: 'Order Details',ontap: (){Get.back();},),
          30.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: size.height/2+45,
              decoration:buildShadowContainer(borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Order code',
                                style:TextStyle(
                                    color: ColorApp.primary,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0),
                                textAlign: TextAlign.center),
                            Text(
                                '10805128',
                                style:TextStyle(
                                    color: ColorApp.primary,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0),
                                textAlign: TextAlign.center),
                          ],
                        ),
                        10.ph,
                        buildRowItem('Service name', 'Service name'),
                        10.ph,
                        buildRowItem('Date :', 'September 21, 2023'),
                        10.ph,
                        buildRowItem('time :', '01:30 pm'),
                        10.ph,
                        Column(
                          children: [
                            buildRowItem('Address',''),
                            buildRowItem('', '95, Opposite Arjun College, Kairav Plot,Township'),
                            buildRowItem('', 'No.21'),
                          ],
                        ),
                        10.ph,
                        buildRowItem('Repeat', 'weekly'),
                        10.ph,
                        buildRowItem('Rooms', '2 room'),
                        10.ph,
                        buildRowItem('Bathroom', '1 Bathroom'),
                        10.ph,
                        buildRowItem('Kitchen', '3 Kitchen'),
                        10.ph,
                        buildRowItem('Extra Service', 'Window , dish washing , Cooking'),
                        10.ph,
                        buildRowItem('Workers', '5 Workers'),
                        10.ph,
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child:Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: ColorApp.primary,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),)
                              ),
                              child:
                              Padding(
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
                            )),
                      ],
                    ),
                  ),
                ],
              ),
          ),
          ),
          const Expanded(child: SizedBox()),
          Container(
            height: 50,
            width: size.width ,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
              child:
              CustomButtonTWo(screenUtil: screenUtil, color: ColorApp.primary, color1: Colors.white, txt: 'Download as pdf'),
            ),
          ),
        ],
      ),
    );
  }
 Widget buildRowItem(String txt1,String txt2,){
    return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              txt1,
              style: const TextStyle(fontSize: 14,color: Colors.grey),
            ),
            Spacer(),
            Text(
              txt2,
              maxLines: 1,
              style: const TextStyle(fontSize: 14,color: Colors.black),
            ),
      ],
    );
  }
}

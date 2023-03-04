import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/constant/const_colors.dart';
import '../../widgets/custom_appbar_two.dart';
import '../../widgets/custom_textform_field.dart';
import '../../widgets/cutom_buttom_two.dart';
import '../../widgets/main_button.dart';

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
          CustomAppBarTwo(110, text: 'Order Details'),
          SizedBox(height: screenUtil.setHeight(30),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: size.height/2+90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 3,
                    spreadRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                    buildRowItem('Service name', 'Service name'),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                    buildRowItem('Date :', 'September 21, 2023'),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                    buildRowItem('time :', '01:30 pm'),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                    Column(
                      children: [
                        buildRowItem('Address',''),
                        buildRowItem('', '95, Opposite Arjun College, Kairav Plot,Township'),
                        buildRowItem('', 'No.21'),
                      ],
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                    buildRowItem('Repeat', 'weekly'),
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
                    buildRowItem('Extra Service', 'Window , dish washing , Cooking'),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                    buildRowItem('Workers', '5 Workers'),
                    SizedBox(
                      height: screenUtil.setHeight(15),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(child: MainButton(text: 'See All Details', color: ColorApp.primary, screenUtil: screenUtil,child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Total',
                                    style:TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 20.0),
                                    textAlign: TextAlign.center),
                                Text(
                                    '260\$',
                                    style:TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18.0),
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          ),))

                        ],
                      ),
                    ),
                  ],
                ),
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
              style: const TextStyle(fontSize: 18,color: Colors.grey),
            ),
            // SizedBox(
            //   height: screenUtil.setHeight(10),
            // ),
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

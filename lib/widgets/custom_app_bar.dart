import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/myController.dart';
import '../theme/constant/const_colors.dart';
import 'arrow_back_icons.dart';

class CustomAppbar extends StatelessWidget {
   CustomAppbar({Key? key}) : super(key: key);
  final controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    Size size = MediaQuery.of(context).size;
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
        width: double.maxFinite,
        height: screenUtil.setHeight(300),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/png/service.png'),fit: BoxFit.cover
          ),
        ),
        child:
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ArrowBackIcon(color: Colors.white,ontap: (){},),
                IconButton(icon:Icon(Icons.menu,color: Colors.white,size: 20,),onPressed: (){},),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffB9FFC0),
                    ),),
                  SizedBox(width: screenUtil.setWidth(10),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('deep Cleaning',style: TextStyle(color: Colors.white,fontSize: 20),),
                      SizedBox(height: screenUtil.setHeight(10),),
                      GetBuilder<MyController>(builder: (_) {
                        return InkWell(
                          onTap: () {
                            controller.isStare();
                          },
                          child: Row(
                            children: [
                              controller.isStar == false
                                  ? const Icon(
                                Icons.star,
                                size: 20,
                              )
                                  : const Icon(Icons.star,
                                  color: Colors.yellow, size: 20),
                              controller.isStar == false
                                  ? const Icon(
                                Icons.star,
                                size: 20,
                              )
                                  : const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              controller.isStar == false
                                  ? const Icon(
                                Icons.star,
                                size: 20,
                              )
                                  : const Icon(Icons.star,
                                  color: Colors.yellow, size: 20),
                              controller.isStar == true
                                  ?  Icon(
                                Icons.star,
                                size: 20,
                                color: ColorApp.starFalse,
                              )
                                  : const Icon(Icons.star,
                                  color: Colors.yellow, size: 20),
                              SizedBox(width: screenUtil.setWidth(10),),
                              const Text(
                                "4.5",
                                style: TextStyle(fontSize: 20,color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

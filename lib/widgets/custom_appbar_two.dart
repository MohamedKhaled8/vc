import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/extensions/extensions.dart';
import '../theme/constant/const_colors.dart';
import 'arrow_back_icons.dart';

class CustomAppBarOne extends StatelessWidget {
  final String text;
  double height = 110;
   CustomAppBarOne(this.height,{Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  ScreenUtil screenUtil = ScreenUtil();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: height,
      decoration: BoxDecoration(
          color: ColorApp.primary,
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          ArrowBackIcon(color: Colors.white,ontap: (){Get.back();}),
           Text(text,style: const TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.normal),),
          const SizedBox(),
          20.pw
          // CustomTextNextButton(),
        ],
      ),
    );
  }
}

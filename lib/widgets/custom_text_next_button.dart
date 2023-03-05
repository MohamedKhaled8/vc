import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/constant/const_colors.dart';
import 'custom_buttom.dart';

class CustomTextNextButton extends StatelessWidget {
final Function()? onTap;
   const CustomTextNextButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    Size size  = MediaQuery.of(context).size;
    return Container(
      height: screenUtil.setHeight(60),
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(
                  0, 3), // changes position of shadow
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '50 \$',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold,color: ColorApp.primary),
          ),
          SizedBox(width: screenUtil.setWidth(120),),
          Container(
            height:screenUtil.setHeight(50),
            width: size.width/2-20,
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(10),
              color: ColorApp.primary,
            ),
            child:CustomButtom(text: 'Next >>', color: ColorApp.primary, screenUtil: screenUtil,color1: Colors.white,ontap: onTap,),
          ),

        ],
      ),
    );
  }
}

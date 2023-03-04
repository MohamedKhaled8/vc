import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/widgets/custom_appbar_two.dart';

import '../../widgets/cutom_buttom_two.dart';

class ChangeCardScreen extends StatelessWidget {
   ChangeCardScreen({Key? key}) : super(key: key);
 final  ScreenUtil screenUtil = ScreenUtil();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: Column(
        children: [
          CustomAppBarTwo(110, text: 'Change Card'),
           SizedBox(height: screenUtil.setHeight(20),),
          Expanded(child: ListView.separated(itemBuilder: (context,index)=>buildContainerItem(context),itemCount: 4,separatorBuilder: (context,index)=>SizedBox(height: 20 ,),)),
          SizedBox(
            height: screenUtil.setHeight(10),
          ),
          Container(
            height: 50,
            width: size.width ,
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
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
              child:
              CustomButtonTWo(screenUtil: screenUtil, color: ColorApp.primary, color1: Colors.white, txt: 'Select Card'),
            ),
          ),
        ],
      ),
    );
  }
  buildContainerItem(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: MediaQuery.of(context).size.width-30,
        height: 100,
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
                width: MediaQuery.of(context).size.width - 50,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:ColorApp.buttonBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}

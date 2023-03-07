import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/extensions/extensions.dart';
import '../../theme/constant/const_colors.dart';
import '../../widgets/custom_appbar_two.dart';
import '../../widgets/cutom_buttom_two.dart';
import 'add_payment_card.dart';

class PaymentSettingScreen extends StatelessWidget {
   PaymentSettingScreen({Key? key}) : super(key: key);
  final  ScreenUtil screenUtil = ScreenUtil();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: Column(
        children: [
          CustomAppBarOne(110, text: 'Payment Settings'),
          20.ph,
          buildContainerItem(context,color:  [
            const Color(0xFF0099D6),
            const Color(0xFF017BAB),
          ],child:Column() ),
          20.ph,
          buildContainerItem(context,color: [
            const Color(0xffF2A91B),
            const Color(0xffBC6907),
          ],child: Column()),
          10.ph,
          Expanded(child: SizedBox()),
          Container(
            height: 50,
            width: size.width ,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
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
              CustomButtonTWo(screenUtil: screenUtil, color: ColorApp.primary, color1: Colors.white, txt: 'Add new Card',onTap: (){
                Get.to(()=>AddPaymentCard());}),
            ),
          ),
        ],
      ),
    );
  }
  Container buildContainerItem(BuildContext context,{required Widget child,required List<Color> color}){
    return Container(
      width: MediaQuery.of(context).size.width-30,
      height: 155,
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
              height: 95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                    stops: const [1.0, 0.0],
                colors:color
              ),
              ),
              child: child,
            ),
          ),
          CustomButtonTWo(
            onTap: () {},
            screenUtil: screenUtil,
            txt: 'Delete Card',
            color: Colors.grey.withOpacity(0.3),
            color1: Colors.black,
          ),
        ],
      ),
    );

  }
}

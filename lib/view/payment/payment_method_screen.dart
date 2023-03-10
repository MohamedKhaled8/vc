import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/view/payment/checkout_screen.dart';
import 'package:vc/widgets/container_shadow.dart';
import 'package:vc/widgets/custom_appbar_two.dart';
import 'package:vc/widgets/custom_text_next_button.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar:DefaultAppBar(110, text: 'payment methods',onTap: (){Get.back();},),

      body: Column(
        children: [
          SizedBox(height: screenUtil.setHeight(100),),
          Expanded(child: Container(
            height: 120,
            width: size.width-40,
            decoration:buildShadowContainer(borderRadius: BorderRadius.circular(20)),
            child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/icons/payment1.png')
                    )
                  ),
                ),
                15.ph,
                Text('Credit /Debit Card',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            ),),
          )),
          SizedBox(height: screenUtil.setHeight(50),),
          Expanded(child: Container(
            height: 120,
            width: size.width-40,
            decoration: buildShadowContainer(borderRadius: BorderRadius.circular(20)),
            child: Center(child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/icons/b2c.png')
                      )
                  ),
                ),
                15.ph,
                Text('Receipt ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            ),
            ),
          )),
          SizedBox(height: screenUtil.setHeight(100),),
          CustomTextNextButton(onTap: (){Get.to(()=>const CheckoutScreen());}),


        ],
      ),
    );
  }
}

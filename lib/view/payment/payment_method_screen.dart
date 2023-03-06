import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
      body: Column(
        children: [
          CustomAppBarTwo(110, text: 'payment methods'),
          SizedBox(height: screenUtil.setHeight(100),),
          Expanded(child: Container(
            height: 120,
            width: size.width-40,
            decoration:buildShadowContainer(borderRadius: BorderRadius.circular(20)),
            child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.payment_outlined,color: Colors.blue,size: 30,),),
                Text('Credit /Debit Card',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            ),),
          )),
          SizedBox(height: screenUtil.setHeight(50),),
          Expanded(child: Container(
            height: 120,
            width: size.width-40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset:Offset(0, 3),
                  spreadRadius: 3,
                  blurRadius: 5,
                )]
            ),
            child: Center(child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.payments,color: Colors.blue,size: 30,),),
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

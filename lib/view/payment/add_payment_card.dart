import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/widgets/custom_appbar_two.dart';
import 'package:vc/widgets/custom_textform_field.dart';
import '../../widgets/cutom_buttom_two.dart';

class AddPaymentCard extends StatelessWidget {
   AddPaymentCard({Key? key}) : super(key: key);
  final  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppBarTwo(110, text: 'Add Payment Card'),
          SizedBox(height: screenUtil.setHeight(50),),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text('Add new card',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: screenUtil.setHeight(30),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: size.height/3,
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  // child: Column(
                  //   children: [
                  //     CustomTextFormField(text: '0000 0000 0000 0000',icon: Icon(Icons.payment_outlined)),
                  //     SizedBox(height: screenUtil.setHeight(20),),
                  //     CustomTextFormField(text: 'Cardholder name'),
                  //     SizedBox(height: screenUtil.setHeight(20),),
                  //      Row(
                  //        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Expanded(
                  //             child: SizedBox(
                  //               width: size.width/2,
                  //                 child: CustomTextFormField(text: 'MM / YY')),
                  //           ),
                  //           SizedBox(width: screenUtil.setWidth(10),),
                  //           Expanded(
                  //             child: SizedBox(
                  //                 width: size.width/2,
                  //                 child: CustomTextFormField(text: 'cvc / cvv')),
                  //           ),
                  //
                  //         ],
                  //     ),
                  //   ],
                  // ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenUtil.setHeight(20),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Checkbox(value: true, onChanged: (value){},activeColor: ColorApp.primary,checkColor: Colors.white),
                const Text('Save card',style:  TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

              ],
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
              CustomButtonTWo(screenUtil: screenUtil, color: ColorApp.primary, color1: Colors.white, txt: 'Select Card'),
            ),
          ),
        ],
      ),
    );
  }
}

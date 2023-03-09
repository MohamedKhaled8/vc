import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/widgets/container_shadow.dart';
import 'package:vc/widgets/custom_appbar_two.dart';

import '../../controller/myController.dart';
import '../../theme/constant/const_colors.dart';
import '../../widgets/cutom_buttom_two.dart';

class RateExperienceScreen extends StatefulWidget {
   const RateExperienceScreen({Key? key}) : super(key: key);

  @override
  State<RateExperienceScreen> createState() => _RateExperienceScreenState();
}

class _RateExperienceScreenState extends State<RateExperienceScreen> {
final ScreenUtil screenUtil = ScreenUtil();
late num ratings;
   final controller = Get.put(MyController());
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  GestureDetector(
      onTap: (){
        // Focus.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   CustomAppBarOne(110, text: 'Rate Experience',ontap: (){Get.back();},),
                   50.ph,
                   Container(
                     height: screenUtil.setHeight(120),
                     width: screenUtil.setWidth(120),
                     decoration: BoxDecoration(
                         color: const Color(0xff20843C)
                             .withOpacity(0.2),
                         borderRadius: BorderRadius.circular(15),
                         image: const DecorationImage(
                           image: AssetImage(
                               "assets/icons/cleaning 1.png"),
                         )),
                   ),
                   15.ph,
                   Text('Deep Cleaning',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                   25.ph,
                   Text('Rate overall exprience',style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),),
                   20.ph,
                   GetBuilder<MyController>(builder: (_) {
                     return RatingBar(
                         ratingWidget: RatingWidget(
                           full: Icon(Icons.star,color: ColorApp.starTrue,),
                             half: const Icon(
                               Icons.star,
                             ),
                           empty:  Icon(
                             Icons.star_border,
                             color: ColorApp.starFalse,
                           ),
                         ),
                         onRatingUpdate: (ratingValue){
                           setState(() {
                             ratings = ratingValue;
                           });
                         }
                     );
                   }),
                 ],
               ),
                20.ph,
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: screenUtil.setHeight(200),
                  decoration: buildShadowContainer(borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    maxLines: 8,
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return 'املاء المطوب';
                      }
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      hintText: 'write some thing ...',
                      hintStyle: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold,color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:Container(
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
          CustomButtonTWo(screenUtil: screenUtil, color: ColorApp.primary, color1: Colors.white, txt: 'Submit Feedback',onTap: (){
            if(formKey.currentState!.validate()){
              Get.showSnackbar(GetSnackBar(
                message: 'thank you for your reviews',
              ));
            }
          },),
        ),
      ),

      ),
    );
  }
}

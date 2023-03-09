import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/widgets/container_shadow.dart';
import 'package:vc/widgets/custom_appbar_two.dart';
import 'package:vc/widgets/rating.dart';
import '../../controller/myController.dart';
import '../../theme/constant/const_colors.dart';
import '../../widgets/cutom_buttom_two.dart';

class RateWorkerScreen extends StatefulWidget {
 const RateWorkerScreen({Key? key}) : super(key: key);

  @override
  State<RateWorkerScreen> createState() => _RateWorkerScreenState();
}

class _RateWorkerScreenState extends State<RateWorkerScreen> {
  final ScreenUtil screenUtil = ScreenUtil();

  final controller = Get.put(MyController());


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomAppBarOne(110, text: 'Rate Experience', ontap: () {
                  Get.back();
                },),
                50.ph,
                Container(
                  height: screenUtil.setHeight(120),
                  width: screenUtil.setWidth(120),
                  decoration: BoxDecoration(
                    color: const Color(0xff20843C)
                        .withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(child: Icon(Icons.person, size: 40,),),
                ),
                15.ph,
                const Text('Wroker1 name', style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold),),
                25.ph,
                const Text('Rate overall exprience', style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.normal),),
                20.ph,
                Align(
                  alignment: Alignment.center,
                  child: CustomRating(),
                ),
                20.ph,

              ],
            ),
            20.ph,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: screenUtil.setHeight(200),
              decoration: buildShadowContainer(
                  borderRadius: BorderRadius.circular(15)),
              child: TextFormField(
                autofocus: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                maxLines: 8,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  hintText: 'write some thing ...',
                  hintStyle: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: size.width,
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
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child:
          CustomButtonTWo(screenUtil: screenUtil,
            color: ColorApp.primary,
            color1: Colors.white,
            txt: 'Next >>',
            onTap: () {
              Get.back();
            },),
        ),
      ),

    );
  }


}
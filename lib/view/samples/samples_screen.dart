import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/widgets/custom_text_next_button.dart';
import '../../controller/myController.dart';
import '../../theme/constant/const_colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_buttom.dart';

class SamplesScreen extends StatelessWidget {
   SamplesScreen({Key? key}) : super(key: key);
  final controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body:  SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
            children: [
            CustomAppbar(),
              Positioned (
                top: 180,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 20, left: 20, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: screenUtil.setHeight(800),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22),
                          topRight: Radius.circular(22),),),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Picture',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            SizedBox(height: screenUtil.setHeight(15),),
                            const Text('Please upload some samples',style: TextStyle(fontSize: 18,color: Colors.grey),),
                            SizedBox(height: screenUtil.setHeight(10),),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 150,
                                    width: size.width/2,
                                    decoration: BoxDecoration(
                                      color: ColorApp.secound,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenUtil.setWidth(15),),

                                Expanded(
                                  child: Container(
                                    height: 150,
                                    width: size.width/2,
                                    decoration: BoxDecoration(
                                      color: ColorApp.primary,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenUtil.setHeight(10),),
                            Container(
                              height: 150,
                              width: size.width/2-20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black,width: 1,style: BorderStyle.solid),
                              ),
                              child: Center(child: IconButton(onPressed: (){}, icon: Icon(Icons.add,size: 25,)),),
                            ),

                            SizedBox(height: screenUtil.setHeight(20),),
                            CustomTextNextButton(),

                          ]
                      ),
                    ),
                  ],
                ),
              ),
        ]
      ),
    ));
  }
}

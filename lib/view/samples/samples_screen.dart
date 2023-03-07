import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/view/payment/payment_method_screen.dart';
import 'package:vc/widgets/custom_text_next_button.dart';
import '../../controller/myController.dart';
import '../../theme/constant/const_colors.dart';
import '../../widgets/custom_app_bar.dart';

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
                            const Text('Picture',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
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
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(
                                        image: AssetImage('assets/icons/Picture1.png'),fit: BoxFit.cover
                                      ),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: Container(
                                    height: 150,
                                    width: size.width/2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                        image: const DecorationImage(
                                            image: AssetImage('assets/icons/Picture2.png'),fit: BoxFit.cover
                                        ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            20.ph,
                            GetBuilder<MyController>(builder: (_){
                              return Container(
                                height: screenUtil.setHeight(180),
                                width: size.width/2-20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black,width: 1,style: BorderStyle.none),
                                ),
                                child:controller.image != null?Image.file(controller.image!,height: 150,fit: BoxFit.cover,):
                                DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(20),
                                  padding: EdgeInsets.all(10),
                                  strokeWidth: 2,
                                  color: ColorApp.grey,
                                  dashPattern: [8, 8, 8, 8],
                                  child: Container(
                                    height: 150,
                                    width: size.width/2-20,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(child: IconButton(onPressed: (){
                                      controller.pickImage();
                                    }, icon: const Icon(Icons.add,size: 25,)),),
                                  ),
                                ),
                              );
                            }),
                            20.ph,
                          ]
                      ),
                    ),
                  ],
                ),
              ),
        ]
      ),
    ),
        bottomNavigationBar: CustomTextNextButton(onTap: (){Get.to(()=>const PaymentMethodScreen());}),

    );
  }
}

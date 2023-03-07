import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/view/samples/samples_screen.dart';
import 'package:vc/widgets/container_shadow.dart';
import 'package:vc/widgets/custom_app_bar.dart';
import 'package:vc/widgets/custom_buttom.dart';
import 'package:vc/widgets/custom_text_next_button.dart';
import '../../controller/myController.dart';
import '../../theme/constant/const_colors.dart';

class ServiceFormScreen extends StatefulWidget {
   ServiceFormScreen({Key? key}) : super(key: key);

  @override
  State<ServiceFormScreen> createState() => _ServiceFormScreenState();
}

class _ServiceFormScreenState extends State<ServiceFormScreen> {
  final controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    SfRangeValues values = SfRangeValues(40.0, 80.0);
    ScreenUtil screenUtil = ScreenUtil();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
         child: Stack(
            children: [
              CustomAppbar(),
              Positioned (
                 top: 150,
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
                           Text('Work area',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                           SfRangeSlider(
                             activeColor: ColorApp.primary,
                             inactiveColor: ColorApp.secound,
                             min: 0.0,
                             max: 100.0,
                             values: values,
                             interval: 20,
                             showTicks: true,
                             showLabels: true,
                             enableTooltip: true,
                             minorTicksPerInterval: 1,
                             onChanged: (SfRangeValues values){
                               setState(() {
                                 values = values;
                               });
                             },
                           ),
                           10.ph,
                           const Text('Date and Time',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                           5.ph,
                           Row(
                             children: [
                               Expanded(child: Container(
                                 height: screenUtil.setHeight(40),
                                 width: size.width/2,
                                 decoration: buildShadowContainer(borderRadius: BorderRadius.circular(10)),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Container(
                                       height: double.infinity,
                                       width: screenUtil.setWidth(50),
                                       decoration: BoxDecoration(
                                         borderRadius:  BorderRadius.circular(10),
                                         color: ColorApp.primary,
                                       ),
                                     ),
                                     10.pw,
                                     const Expanded(child: Text(
                                       "September 21, 2023",
                                       style: TextStyle(
                                           fontSize: 12, fontWeight: FontWeight.normal),
                                     ),)

                                   ],
                                 ),
                               ),),
                               10.pw,
                               Expanded(child: Container(
                                 height: screenUtil.setHeight(40),
                                 width: size.width/2,
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
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Container(
                                       height: double.infinity,
                                       width: screenUtil.setWidth(50),
                                       decoration: BoxDecoration(
                                         borderRadius:  BorderRadius.circular(10),
                                         color: ColorApp.primary,
                                       ),
                                     ),
                                     10.pw,
                                     const Expanded(child: Text(
                                       "04 : 35 pm",
                                       style: TextStyle(
                                           fontSize: 12, fontWeight: FontWeight.normal),
                                     ),)
                                   ],
                                 ),
                               ),),
                             ],
                           ),
                           15.ph,
                           const Text('Address',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                           10.ph,
                           Container(
                             height: screenUtil.setHeight(55),
                             width: size.width,
                             decoration:buildShadowContainer(borderRadius: BorderRadius.circular(10)),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Container(
                                   height: double.infinity,
                                   width: screenUtil.setWidth(50),
                                   decoration: BoxDecoration(
                                     borderRadius:  BorderRadius.circular(10),
                                     color: ColorApp.primary,
                                   ),
                                 ),
                                 10.pw,
                                 const Expanded(child: Text(
                                   '95, Opposite Arjun College, Kairav Plot',
                                   style: TextStyle(
                                       fontSize: 12, fontWeight: FontWeight.normal),
                                 ),),
                               ],
                             ),
                           ),
                           10.ph,
                           const Text('Repeat',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                           10.ph,
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Expanded(child:CustomButtom(text: 'Once', color: ColorApp.primary, screenUtil: screenUtil,color1: Colors.white,),),
                               SizedBox(width: screenUtil.setWidth(10),),
                               Expanded(child:CustomButtom(text: 'Weekly', color: Colors.white, screenUtil: screenUtil,color1: ColorApp.primary,),),
                               SizedBox(width: screenUtil.setWidth(10),),
                               Expanded(child:CustomButtom(text: 'Monthly', color: Colors.white, screenUtil: screenUtil,color1: ColorApp.primary,),),
                             ],
                           ),
                            10.ph,
                           const Text('Extra Service',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                           10.ph,
                           Column(
                             children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Expanded(child:CustomButtom(text: 'Cooking', color: ColorApp.primary, screenUtil: screenUtil,color1: Colors.white,),),
                                   Expanded(child:CustomButtom(text: 'Once', color: Colors.white, screenUtil: screenUtil,color1: ColorApp.primary,),),
                                   Expanded(child:CustomButtom(text: 'Washing & Cooking', color: Colors.white, screenUtil: screenUtil,color1: ColorApp.primary,),),

                                 ],
                               ),
                               SizedBox(height: screenUtil.setHeight(10),),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Expanded(child:CustomButtom(text: 'Window', color: ColorApp.primary, screenUtil: screenUtil,color1: Colors.white,),),
                                   Expanded(child:CustomButtom(text: 'Dish Washing', color: Colors.white, screenUtil: screenUtil,color1: ColorApp.primary,),),
                                   Expanded(child:CustomButtom(text: 'Cooking', color: Colors.white, screenUtil: screenUtil,color1: ColorApp.primary,),),

                                 ],
                               ),
                             ],
                           ),
                           10.ph,

                         ]
                           ),
                       ),
                   ],
                 ),
        ),
            ],
          ),
      ),
      bottomNavigationBar: CustomTextNextButton(onTap: (){Get.to(()=>SamplesScreen());}),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vc/controller/service_form_controller.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/view/samples/samples_screen.dart';
import 'package:vc/widgets/container_shadow.dart';
import 'package:vc/widgets/custom_app_bar.dart';
import 'package:vc/widgets/custom_text_next_button.dart';
import 'package:vc/widgets/slider.dart';
import '../../theme/constant/const_colors.dart';

class ServiceFormScreen extends StatefulWidget {
  const ServiceFormScreen({Key? key}) : super(key: key);
  @override
  State<ServiceFormScreen> createState() => _ServiceFormScreenState();
}

class _ServiceFormScreenState extends State<ServiceFormScreen> {
 final TextEditingController dateInput = TextEditingController();
final  TextEditingController timeInput = TextEditingController();
  final controller = Get.put(ServiceFormController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
         child: Stack(
            children: [
              CustomAppbar(),
              GetBuilder<ServiceFormController>(builder: (_){
                return Positioned (
                  top: 170,
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
                              const Text('Work area',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              5.ph,
                              const SliderView(),
                              8.ph,
                              const Text('Date and Time',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              5.ph,
                              Row(
                                children: [
                                  Expanded(
                                    child:  Container(
                                      height: screenUtil.setHeight(40),
                                      width: size.width/2,
                                      decoration: buildShadowContainer(borderRadius: BorderRadius.circular(10)),
                                      child: TextField(
                                        controller: dateInput,
                                        decoration:  InputDecoration(
                                          hintText: "September 21, 2023",
                                          hintStyle: TextStyle(fontSize: 10,color: Colors.black),
                                          border: InputBorder.none,
                                          icon: Container(
                                            height:screenUtil.setWidth(40) ,
                                            width: screenUtil.setWidth(40),
                                            decoration: BoxDecoration(
                                              borderRadius:  BorderRadius.circular(10),
                                              color: ColorApp.primary,
                                              image: const DecorationImage(
                                                  image: AssetImage('assets/icons/c1.png')
                                              ),
                                            ),
                                          ),
                                        ),
                                        readOnly: true,
                                        onTap: () async {
                                          DateTime? pickedDate = await showDatePicker(
                                            context: context, initialDate: DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2101),
                                          );
                                          if(pickedDate != null ){
                                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                            setState(() {
                                              dateInput.text = formattedDate;
                                            });
                                          }else{
                                            print("Date is not selected");
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  10.pw,
                                  Expanded(
                                    child:  Container(
                                      height: screenUtil.setHeight(40),
                                      width: size.width/2,
                                      decoration: buildShadowContainer(borderRadius: BorderRadius.circular(10)),
                                      child: TextField(
                                        controller: timeInput,
                                        decoration:  InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "04 : 35 pm",
                                          hintStyle: const TextStyle(fontSize: 12,color: Colors.black),
                                          icon: Container(
                                            height:screenUtil.setWidth(40) ,
                                            width: screenUtil.setWidth(40),
                                            decoration: BoxDecoration(
                                              borderRadius:  BorderRadius.circular(10),
                                              color: ColorApp.primary,
                                              image: const DecorationImage(
                                                  image: AssetImage('assets/icons/c2.png')
                                              ),
                                            ),
                                          ),
                                        ),
                                        readOnly: true,
                                        onTap: () async {
                                          TimeOfDay? pickedTime =  await showTimePicker(
                                            initialTime: TimeOfDay.now(),
                                            context: context,
                                          );
                                          if(pickedTime != null ){
                                            DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                                            String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                                            setState(() {
                                              timeInput.text = formattedTime;
                                            });
                                          }else{
                                            print("Time is not selected");
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              5.ph,
                              const Text('Address',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              5.ph,
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
                                        image: const DecorationImage(
                                            image: AssetImage('assets/icons/c3.png')
                                        ),
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
                              SizedBox(
                                height: 40,
                                child: ListView.separated(
                                    separatorBuilder: (context,index)=>15.pw,
                                    itemCount: controller.cats.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (ctx, index) {
                                      return controller.cartItem1(index: index,'',context);
                                    }),
                              ),
                              10.ph,
                              const Text('Extra Service',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              10.ph,
                              SizedBox(
                                height: 40,
                                child: ListView.separated(
                                    separatorBuilder: (context,index)=>15.pw,
                                    itemCount:controller. service1.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (ctx, index) {
                                      return controller.cartItem2(index: index,'',context);
                                    }),
                              ),
                              10.ph,
                              SizedBox(
                                height: 40,
                                child: ListView.separated(
                                    separatorBuilder: (context,index)=>15.pw,
                                    itemCount: controller.service2.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (ctx, index) {
                                      return controller.cartItem3(index: index,'',context);
                                    }),
                              ),
                            ]
                        ),
                      ),
                    ],
                  ),
                );

              },
              ),
            ],
          ),
      ),
      bottomNavigationBar: CustomTextNextButton(onTap: (){Get.to(()=>SamplesScreen());}),
    );
  }

}
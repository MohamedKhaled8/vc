import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/controller/home_controller.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/widgets/container_shadow.dart';
import 'package:vc/widgets/custom_appbar_two.dart';
import 'package:vc/widgets/custom_textformfied%20_password.dart';
import '../../../theme/constant/const_colors.dart';
import '../../../widgets/custom_textform_field.dart';
import '../../../widgets/cutom_buttom_two.dart';

class ProfileSettingScreen extends StatelessWidget {
  ProfileSettingScreen({Key? key}) : super(key: key);
  final  ScreenUtil screenUtil = ScreenUtil();
  final TextEditingController number= TextEditingController();
  final TextEditingController name= TextEditingController();
  final TextEditingController email= TextEditingController();
  final TextEditingController phone= TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  CustomAppBarOne(160, text: 'Profile Setting '),
                  Positioned(
                      bottom: -50,
                      child: Container(height: 100,width: 100,decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 3,
                              blurRadius: 3,
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(0, 3),
                            ),
                          ],
                          image: const DecorationImage(
                            image: AssetImage('assets/images/jpeg/mohamed.jpeg',),fit: BoxFit.cover,)

                      ),
                         // child: controller.image != null?Image.file(controller.image!): Image.asset('assets/images/jpeg/mohamed.jpeg'),
                      ),
                  ),
                     GetBuilder<ProfileController>(builder: (_){
                       return Positioned(
                         bottom: -51,
                         child: InkWell(
                           onTap: (){
                             controller.pickImage();
                           },
                           child: Container(
                             height: 25,width: 35,decoration: buildShadowContainer(borderRadius: BorderRadius.circular(10)),
                             child: const Center(child: Icon(Icons.person),),),
                         ),
                       );
                     }),
                  ],
              ),
              45.ph,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                    10.ph,
                    Container(
                      height: size.height/2-94,
                      decoration: buildShadowContainer(borderRadius: BorderRadius.circular(20)),
                      child:  Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                text: 'Ahmed Mabrouk',
                                controller: name,
                                icon: const Icon(Icons.edit_calendar_outlined),
                                type: TextInputType.name,
                              ),
                              10.ph,
                              CustomTextFormField(
                                text: 'national identification number',
                                controller: number,
                                icon: const Icon(Icons.edit_calendar_outlined),
                                type: TextInputType.number,
                              ),
                              10.ph,
                              CustomTextFormField(
                                text: 'Ahmed@gmail.com',
                                controller: email,
                                icon: const Icon(Icons.edit_calendar_outlined),
                                type: TextInputType.emailAddress,
                              ),
                              10.ph,
                              CustomTextFormField(
                                text: '0201112|',
                                controller: phone,
                                icon: const Icon(Icons.edit_calendar_outlined),
                                type: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    10.ph,
                    const Text('Address',style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                    10.ph,
                    Container(
                      height: 119,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 3,
                            spreadRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child:  Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            CustomTextFormField(
                              text: '95, Opposite Arjun College, Kairav Plot, Township No. 21',
                              controller: name,
                              icon: const Icon(Icons.edit_calendar_outlined,color: Colors.grey,),
                              type: TextInputType.name,
                            ),
                            7.ph,
                            Center(
                              child: Container(
                                width: size.width / 2,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: ColorApp.primary),

                                   ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width:30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: ColorApp.primary),
                                        ),
                                        child: Center(child: Icon(Icons.add,color: ColorApp.primary,)),
                                      ),
                                     10.pw,
                                      Expanded(
                                          child: Text(
                                            ' Add Address',
                                            style: TextStyle(color: ColorApp.primary, fontSize: 14),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.ph,
                    Container(
                      height: size.height/3-38,
                      decoration: buildShadowContainer(borderRadius: BorderRadius.circular(20),),
                      child:  Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            CustomTextFormFieldPassword(text: 'Old password'),
                            10.ph,
                            CustomTextFormFieldPassword(text: 'New password'),
                            10.ph,
                            CustomTextFormFieldPassword(text: 'Confirm password'),
                          ],
                        ),
                      ),
                    ),
                    20.ph,
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          width: size.width ,
          decoration:buildShadowContainer(borderRadius: BorderRadius.circular(20),),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
            child:
            CustomButtonTWo(screenUtil: screenUtil, color: ColorApp.primary, color1: Colors.white, txt: 'Save Changes',onTap: (){
              Get.back();
            },),
          ),
        ),
      ),
    );
  }
}

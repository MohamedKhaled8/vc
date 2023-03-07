// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/theme/extensions/extensions.dart';

import '../../widgets/arrow_back_icons.dart';
import '../../widgets/custom_textform_field.dart';
import '../../widgets/custom_textformfied _password.dart';
import '../../widgets/cutom_buttom_two.dart';
import 'auth_view.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  ScreenUtil screenUtil = ScreenUtil();
  final TextEditingController fName= TextEditingController();
  final TextEditingController email= TextEditingController();
  final TextEditingController phone= TextEditingController();
  final TextEditingController address= TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            60.ph,
             Padding(
               padding: const EdgeInsets.only(left: 20,bottom: 10),
               child: ArrowBackIcon(
                ontap: () {
                  Get.to(const AuthAppView());
                },
               ),
             ),
            Column(
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: ColorApp.primary),
                ),
                const Text(
                  "Create your account",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: formKey,
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFormField(
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'املاء المطوب';
                            }
                            return null;
                          },
                          controller:fName ,
                          type: TextInputType.name,
                          text: 'Enter full name',
                        ),
                        SizedBox(height: screenUtil.setHeight(20)),
                        CustomTextFormField(
                            validate:(value) {
                            if (value == null || value.isEmpty) {
                              return 'املاء المطوب';
                            }
                            return null;
                          },
                          controller:address ,
                          type: TextInputType.name,
                          text: 'Enter address',
                        ),
                        SizedBox(height: screenUtil.setHeight(20)),
                        CustomTextFormField(
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'املاء المطوب';
                            }
                            return null;
                          },
                          controller:phone ,
                          type: TextInputType.number,
                          text: 'Enter phone number',
                        ),
                        SizedBox(height: screenUtil.setHeight(20)),
                        CustomTextFormField(
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'املاء المطوب';
                            }
                            else if (!value.contain('@')){
                              return 'invalid Email';
                            }
                            return null;
                          },
                          controller:email ,
                          type: TextInputType.emailAddress,
                          text: 'Enter email',
                        ),
                        SizedBox(height: screenUtil.setHeight(20)),
                        CustomTextFormFieldPassword(
                          text: 'Enter Password',
                        ),
                        SizedBox(height: screenUtil.setHeight(20)),
                        CustomTextFormFieldPassword(
                          text: 'Confirm password',
                        ),
                        SizedBox(height: screenUtil.setHeight(20)),
                        CustomButtonTWo(
                          onTap: () {
                            if(formKey.currentState!.validate()){
                              Get.to(()=>SignUpView());
                            }
                          },
                          screenUtil: screenUtil,
                          txt: 'Sign up',
                          color: ColorApp.primary,
                          color1: Colors.white,
                        ),
                        SizedBox(height: screenUtil.setHeight(10)),
                       Row(
                         children: const [
                       Expanded(child: Divider(height: 20,color: Colors.black,)),
                           Text("  OR SIGN IN WITH  " , style: TextStyle(fontSize: 14),),
                           Expanded(child: Divider(height: 2,color: Colors.black,)),
                         ],
                       ),
                        SizedBox(height: screenUtil.setHeight(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/icons/Google.png"),
                            Image.asset("assets/icons/facebook.png"),
                          ],
                        ),
                      ],
                    )),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

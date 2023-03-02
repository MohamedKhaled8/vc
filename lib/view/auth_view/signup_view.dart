// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:vc/theme/constant/const_colors.dart';

import '../../widgets/arrow_back_icons.dart';
import '../../widgets/custom_textform_field.dart';
import '../../widgets/custom_textformfied _password.dart';
import '../../widgets/cutom_buttom_two.dart';
import 'auth_view.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  ScreenUtil screenUtil = ScreenUtil();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             ArrowBackIcon(
              ontap: () {
                Get.to(const AuthAppView());
              },
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
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFormField(
                          text: 'Enter full name',
                        ),
                        SizedBox(height: screenUtil.setHeight(20)),
                        CustomTextFormField(
                          text: 'Enter address',
                        ),
                        SizedBox(height: screenUtil.setHeight(20)),
                        CustomTextFormField(
                          text: 'Enter phone number',
                        ),
                        SizedBox(height: screenUtil.setHeight(20)),
                        CustomTextFormField(
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
                        customButtomTWo(
                          ontap: () {
                            Get.to(SignUpView());
                          },
                          screenUtil: screenUtil,
                          txt: 'Sign up',
                          color: ColorApp.primary,
                          color1: Colors.white,
                        ),
                        SizedBox(height: screenUtil.setHeight(10)),
                        const Text("OR SIGN IN WITH" , style: TextStyle(fontSize: 14),),
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

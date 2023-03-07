

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/view/auth_view/signup_view.dart';

import '../../theme/constant/const_colors.dart';
import '../../widgets/arrow_back_icons.dart';
import '../../widgets/custom_textform_field.dart';
import '../../widgets/cutom_buttom_two.dart';
import 'code _confirm_view.dart';
import 'login_view.dart';

// ignore: must_be_immutable
class ForgotPasswordView extends StatelessWidget {
   ForgotPasswordView({super.key});
ScreenUtil screenUtil = ScreenUtil();
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

   final TextEditingController email= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 40),
                child: ArrowBackIcon(ontap: () {
                  Get.to( LoginView());
                },),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/Agora cleaning.png"),
                      SizedBox(
                        height: screenUtil.setHeight(10),
                      ),
                      const Text("Slogan for Agora cleaning"),
                      SizedBox(
                        height: screenUtil.setHeight(30),
                      ),
                      Text(
                        "Forgot password ?",
                        style: TextStyle(
                            fontSize: 18,

                            color: ColorApp.primary),
                      ),
                      SizedBox(
                        height: screenUtil.setHeight(10),
                      ),
                      const Text(
                        "Dont Worry! it's happening ",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            ),
                      ),
                      SizedBox(
                        height: screenUtil.setHeight(40),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Form(
                            child: Column(
                          children: [
                            CustomTextFormField(
                              type: TextInputType.number,
                              controller: email,
                              text: 'Enter email/ Phone number',
                            ),
                             SizedBox(
                        height: screenUtil.setHeight(40),
                      ),
                             CustomButtonTWo(
                            onTap: () {
                              if(formKey.currentState!.validate()){
                              Get.to(()=>CodeConfirmView());
                            }},
                            screenUtil: screenUtil,
                            txt: 'Submit',
                            color: ColorApp.primary,
                            color1: Colors.white,
                          ),
                          ]
                            ),

                        ),
                      ),
                          ],
                        )),
                      )
                    ],
                  ),
        ),
              ));
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/view/home_view/bottom_nav_bar.dart';
import 'package:vc/widgets/custom_buttom.dart';
import '../../theme/constant/const_colors.dart';
import '../../widgets/arrow_back_icons.dart';
import '../../widgets/custom_textform_field.dart';
import 'forgot_password.dart';

// ignore: must_be_immutable
class CodeConfirmView extends StatelessWidget {
  CodeConfirmView({super.key});
  ScreenUtil screenUtil = ScreenUtil();
  // ignore: unused_field
  final TextEditingController code= TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 40),
            child: ArrowBackIcon(ontap: () {
              Get.to( ForgotPasswordView());
            },),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/Agora cleaning.png"),
                const Text("Slogan for Agora cleaning"),
                SizedBox(
                  height: screenUtil.setHeight(70),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "we send code to verify your email ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(children: [
                      CustomTextFormField(
                        text: 'Enter code ',
                        controller: code,
                        type: TextInputType.name,
                      ),
                      SizedBox(
                        height: screenUtil.setHeight(30),
                      ),
                      CustomButtom(text: 'Confirm', color: ColorApp.primary, screenUtil: screenUtil,color1: Colors.white,ontap: (){
                        if(formKey.currentState!.validate()){
                          Get.to(()=>const BottomNavBar());
                        }
                      },),
                      SizedBox(
                        height: screenUtil.setHeight(30),
                      ),
                      const Text(
                        "didn't receive the code ?",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: screenUtil.setHeight(10),
                      ),
                      Text(
                        "resend code",
                        style: TextStyle(fontSize: 14, color: ColorApp.primary),
                      ),
                    ]),
                  ),
                ),
              ],
            )),
          )
        ],
      ),
    ));
  }
}

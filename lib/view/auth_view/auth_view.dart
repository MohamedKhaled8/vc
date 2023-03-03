// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/view/auth_view/signup_view.dart';
import 'package:vc/view/onboarding_screen_view/onboarding_screen.dart';

import '../../theme/constant/const_colors.dart';
import '../../widgets/cutom_buttom_two.dart';
import '../spalsh_view/splash_screen_view.dart';
import 'login_view.dart';

class AuthAppView extends StatelessWidget {
  const AuthAppView({super.key});
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ScreenUtil screenUtil = ScreenUtil();
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Get.to(const OnBoardingScreen());
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size(130, 50),
                        textStyle: const TextStyle(fontSize: 18),
                        side: const BorderSide(width: 1, color: Colors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {},
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/Agora cleaning.png"),
                  const Text("Slogan for Agora cleaning"),
                  SizedBox(
                    height: screenUtil.setHeight(40),
                  ),
                  Image.asset("assets/icons/clean2.png"),
                  SizedBox(
                    height: screenUtil.setHeight(30),
                  ),
                ],
              ),
            ),
          ),
          CustomButtonTWo(
            ontap: (){
              Get.to( SignUpView());
            },
            screenUtil: screenUtil,
            txt: 'Sign up',
            color: ColorApp.primary,
            color1: Colors.white,
          ),
          SizedBox(
            height: screenUtil.setHeight(30),
          ),
          CustomButtonTWo(
            ontap: (){
              Get.to(const LoginView());
            },
            screenUtil: screenUtil,
            txt: 'Log in',
            color: ColorApp.secound,
            color1: Colors.black,
          ),
          SizedBox(
            height: screenUtil.setHeight(30),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types


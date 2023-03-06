import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/view/auth_view/signup_view.dart';
import 'package:vc/view/home_view/bottom_nav_bar.dart';
import 'package:vc/view/onboarding_screen_view/onboarding_screen.dart';

import '../../theme/constant/const_colors.dart';
import '../../widgets/arrow_back_icons.dart';
import '../../widgets/cutom_buttom_two.dart';
import '../home_view/home.dart';
import '../spalsh_view/splash_screen_view.dart';
import 'login_view.dart';

class AuthAppView extends StatelessWidget {
  const AuthAppView({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ArrowBackIcon(ontap: (){ Get.to(const OnBoardingScreen());},),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size(130, 50),
                        textStyle: const TextStyle(fontSize: 18),
                        side: const BorderSide(width: 1, color: Colors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Get.to(()=>BottomNavBar());
                    },
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
                  const Text("Slogan for Agora cleaning",style: TextStyle(color: Colors.grey),),
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
          Expanded(
            child: CustomButtonTWo(
              onTap: (){
                Get.to( SignUpView());
              },
              screenUtil: screenUtil,
              txt: 'Sign up',
              color: ColorApp.primary,
              color1: Colors.white,
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(20),
          ),
          Expanded(
            child: CustomButtonTWo(
              onTap: (){
                Get.to( LoginView());
              },
              screenUtil: screenUtil,
              txt: 'Log in',
              color: ColorApp.secound,
              color1: Colors.black,
            ),
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


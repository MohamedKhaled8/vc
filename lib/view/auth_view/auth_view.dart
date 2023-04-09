import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/view/auth_view/signup_view.dart';
import 'package:vc/view/home_view/bottom_nav_bar.dart';
import 'package:vc/view/onboarding_screen_view/onboarding_screen.dart';

import '../../theme/constant/const_colors.dart';
import '../../widgets/arrow_back_icons.dart';
import '../../widgets/cutom_buttom_two.dart';

import 'login_view.dart';

class AuthAppView extends StatelessWidget {
  const AuthAppView({super.key});
  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ArrowBackIcon(
                    ontap: () {
                      Get.to(const OnBoardingScreen());
                    },
                  ),
                ],
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        "assets/icons/152 - 38 Valu Clean Care Site Logo 02.png"),
                    const Text(
                      "Slogan for Value cleaning",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(40),
                    ),
                    Image.asset(
                      "assets/icons/626 - 626 Character Valu Clean.png",
                      height: screenUtil.setHeight(270),
                      width: screenUtil.setHeight(310),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(30),
                    ),
                  ],
                ),
              ),
            ),
            CustomButtonTWo(
              onTap: () {
                Get.to(
                  SignUpView(),
                  duration: const Duration(milliseconds: 1000),
                  transition: Transition.downToUp,
                );
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
              onTap: () {
                Get.to(
                  LoginView(),
                  duration: const Duration(milliseconds: 1000),
                  transition: Transition.leftToRight,
                );
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
      ),
    );
  }
}

// ignore: camel_case_types


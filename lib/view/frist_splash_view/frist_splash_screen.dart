import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/theme/constant/sized.dart';
import 'package:vc/view/spalsh_view/splash_screen_view.dart';

class FristSplashScreen extends StatefulWidget {
  const FristSplashScreen({super.key});

  @override
  State<FristSplashScreen> createState() => _FristSplashScreenState();
}

class _FristSplashScreenState extends State<FristSplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }

  timer() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(
      () => const SplashScreen(),
      transition: Transition.fade,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      body: SizedBox(
        height: screenUtil.screenHeight - 100,
        width: screenUtil.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
                "assets/icons/152 - 38 Valu Clean Care Site Logo 02.png"),
            SizedBox(
              height: screenUtil.setHeight(40),
            ),
            Image.asset(
              'assets/images/jpeg/626 - 626 Character Valu Clean.png',
              height: screenUtil.setHeight(300),
            ),
            SizedBox(
              height: screenUtil.setHeight(115),
            ),
            const Text(
              "Designed By Dr.Code Company • Copyright ©2023",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.8,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

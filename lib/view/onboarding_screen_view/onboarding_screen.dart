import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/view/spalsh_view/splash_screen_view.dart';

import '../../model/onboarding_content.dart';
import '../../theme/constant/const_colors.dart';
import '../../widgets/custom_buttom.dart';
import '../auth_view/auth_view.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  // ignore: unused_field
  PageController? _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            InkWell(
                onTap: () {
        
                Get.to(const SplahScreen());
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            Expanded(
              child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: contents.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenUtil.setHeight(40),
                          ),
                          Image.asset(
                            contents[index].image!,
                            height: screenUtil.setHeight(300),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(40),
                          ),
                          Text(
                            contents[index].title!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(20),
                          ),
                          Text(contents[index].discription!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                        ],
                      ),
                    );
                  }),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    contents.length,
                    (index) => Row(
                          children: [
                            buildDot(index),
                          ],
                        ))),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButtom(
                  screenUtil: screenUtil,
                  text: 'Skip' ,
                  color: ColorApp.secound, color1: Colors.black,
                ),
                CustomButtom(
                    ontap: () {
                      if (currentIndex == contents.length - 1) {
                        Get.to(const AuthAppView());
                      }
                      _controller?.nextPage(
                          duration: const Duration(microseconds: 100),
                          curve: Curves.bounceIn);
                    },
                    screenUtil: screenUtil,
                    text: 'Next',
                    color: ColorApp.primary , 
                    color1: Colors.white,
                    ),
                    
              ],
            ),
            // ignore: prefer_const_constructors
           const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(
    int index,
  ) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorApp.primary,
      ),
    );
  }
}

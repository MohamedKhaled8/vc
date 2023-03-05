import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:vc/widgets/container_shadow.dart';
import '../../widgets/custom_buttom.dart';
import '../onboarding_screen_view/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  String? seclected;
  List<String> lang = ["English  , Swide"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/Agora cleaning.png"),
              SizedBox(
                height: screenUtil.setHeight(10),
              ),
              const Text("Slogan for Agora cleaning"),
              SizedBox(
                height: screenUtil.setHeight(40),
              ),
              Image.asset("assets/icons/clean2.png"),
              SizedBox(
                height: screenUtil.setHeight(30),
              ),
              Container(
                width: screenUtil.setWidth(308),
                height: screenUtil.setHeight(48),
                decoration:buildShadowContainer(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButton(
                      hint: Row(
                        children: [
                          Image.asset("assets/icons/Language.png"),
                          SizedBox(
                            width: screenUtil.setWidth(20),
                          ),
                          const Text("Language"),
                        ],
                      ),
                      icon: const Icon(Icons.arrow_drop_down),
                      dropdownColor: Colors.white,
                      underline: const SizedBox(),
                      isExpanded: T,
                      value: seclected,
                      items: lang.map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          seclected = value as String?;
                        });
                      }),
                ),
              ),
              SizedBox(
                height: screenUtil.setHeight(30),
              ),
              CustomButtom(
                  screenUtil: screenUtil,
                  text: 'Start',
                  color: Colors.green,
                  color1: Colors.white,
                  ontap: () {
                    Get.to(const OnBoardingScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

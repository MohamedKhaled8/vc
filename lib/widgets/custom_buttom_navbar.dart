import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/view/messages/views/chat_view.dart';
import 'package:vc/view/service_form/service_form_screen.dart';

import '../model/services_model/user_home_model.dart';
import '../theme/constant/const_colors.dart';

class CustomButtomNavBar extends StatelessWidget {
  final Service? serviceModel;

  const CustomButtomNavBar({
    super.key,
    required this.screenUtil,
    this.ontap,
    required this.serviceModel,
  });
  final Function()? ontap;
  final ScreenUtil screenUtil;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      height: screenUtil.setHeight(80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Get.to(
                  ChatView(),
                  transition: Transition.leftToRight,
                  duration: const Duration(milliseconds: 1000),
                );
              },
              child: Container(
                height: screenUtil.setHeight(120),
                width: screenUtil.setWidth(165),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xff004E64)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assets/icons/chat.png"),
                    const Text(
                      "Chat",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: ontap,
              child: Container(
                height: screenUtil.setHeight(120),
                width: screenUtil.setWidth(165),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: ColorApp.primary),
                child: InkWell(
                  onTap: () {
                    Get.to(
                      () => ServiceFormScreen(
                        serviceModel: serviceModel,
                      ),
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 1000),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Schedule",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Image.asset("assets/icons/schedule2.png"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

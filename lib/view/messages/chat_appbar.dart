import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/theme/constant/sized.dart';
import 'package:vc/widgets/arrow_back_icons.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenUtil.setHeight(125),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            ArrowBackIcon(
              ontap: () {
                Get.back();
              },
            ),
            Container(
              height: screenUtil.setHeight(85),
              width: screenUtil.setWidth(85),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorApp.primary.withOpacity(0.3)),
              child: Image.asset("assets/icons/cleaning 1.png"),
            ),
            SizedBox(
              width: screenUtil.setHeight(15),
            ),
            const Text(
              "Deep Cleaning ",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              width: screenUtil.setHeight(90),
            ),
            InkWell(onTap: () {}, child: Image.asset("assets/icons/video.png")),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/constant/const_colors.dart';
import 'arrow_back_icons.dart';

class CustomContainerTopScreen extends StatelessWidget {
  CustomContainerTopScreen({
    Key? key,
    required this.text,
    required this.screenUtil,
     required this.size,
    this.ontap,
  }) : super(key: key);
  final String text;
  final ScreenUtil screenUtil;
  double? size;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
      height: screenUtil.setHeight(size!),
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorApp.primary,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            InkWell(
              onTap: ontap,
              child: const ArrowBackIcon(
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: screenUtil.setWidth(110),
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

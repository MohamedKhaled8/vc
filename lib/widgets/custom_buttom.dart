// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    Key? key,
    required this.text,
    required this.color,
    required this.screenUtil,
    this.color1,
    this.ontap,
  }) : super(key: key);
  final String text;
  final Color color;
  final Color? color1;
  final ScreenUtil screenUtil;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: screenUtil.setHeight(48),
        width: screenUtil.setWidth(170),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color(0x33000000),
                offset: Offset(0, 0),
                blurRadius: 8,
                spreadRadius: 0)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: color1,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
    // ignore: dead_code
  }
}

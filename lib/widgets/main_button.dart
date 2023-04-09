import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.text,
    required this.color,
    required this.screenUtil,
    this.onTap,
    required this.child,
  }) : super(key: key);
  final String text;
  final Color color;
  final ScreenUtil screenUtil;
  final Function()? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: screenUtil.setHeight(48),
        width:MediaQuery.of(context).size.width-40 ,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          boxShadow:  const [
            BoxShadow(
                color: Color(0x33000000),
                offset: Offset(0, 0),
                blurRadius: 8,
                spreadRadius: 0)
          ],
        ),
      child: child,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class CustomButtonTWo extends StatelessWidget {
  CustomButtonTWo({
    Key? key,
    required this.screenUtil,
    required this.color,
    required this.color1,
    required this.txt,
    this.onTap,

  }) : super(key: key);

  final ScreenUtil screenUtil;
  final Color color;
  final Color color1;
  final String txt;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
           height: screenUtil.setHeight(48),
         width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
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
              Text(txt,
                  style: TextStyle(color: color1, fontSize: 18.0),
                  textAlign: TextAlign.center),
                  SizedBox(width: screenUtil.setWidth(5),),
            
            ],
          )),
    );
  }
}

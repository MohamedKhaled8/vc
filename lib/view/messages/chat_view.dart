// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vc/theme/constant/const_colors.dart';

import '../../../widgets/arrow_back_icons.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    return SafeArea(
      child: Scaffold(
          body: Container(
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
                children:   [
                  const ArrowBackIcon(),
                   Container(
                    height: screenUtil.setHeight(85),
                    width: screenUtil.setWidth(85),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorApp.primary.withOpacity(0.3)),
                    child: Image.asset("assets/icons/cleaning 1.png"),
                  ),
                SizedBox(width: screenUtil.setHeight(15),),
                  Text("Deep Cleaning " , style: TextStyle(fontSize: 16),),
                   SizedBox(width: screenUtil.setHeight(90),),
                  InkWell(
                    onTap: () {

                    },
                    child: Image.asset("assets/icons/video.png")),
                    Column(
                      children: [

                      ],
                    )
                ],
              ),
            ),
  
      ),
      
      
      ),
    );
  }
}

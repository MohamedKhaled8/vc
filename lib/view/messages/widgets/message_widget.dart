import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/controller/myController.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/view/messages/views/chat_view.dart';
import 'package:vc/widgets/container_shadow.dart';

import '../../../theme/constant/const_colors.dart';

class MessageDesign extends StatelessWidget {
  const MessageDesign({
    super.key,
    required this.screenUtil,
    required this.controller,
  });

  final ScreenUtil screenUtil;
  final MyController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=> ChatView());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          padding: const EdgeInsets.all(5),
          height: screenUtil.setHeight(100),
          decoration: buildShadowContainer(borderRadius: BorderRadius.circular(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              5.pw,
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                height: screenUtil.setHeight(100),
                width: screenUtil.setWidth(80),
                decoration:  BoxDecoration(
                  color: ColorApp.messageColor,
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/icons/cleaning 1.png"),
                      fit: BoxFit.cover),
                ),
              ),
             10.pw,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child:  Text(
                          'Deep Cleaning ',
                          style:TextStyle(color: ColorApp.primary,fontSize: 14)
                        ),),
                        const Text(
                          '10 hours ago',
                          style:TextStyle(color: Colors.grey,fontSize: 12)
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Lorem ipsum dolor sit amet,.......',
                                style:TextStyle(color: Colors.grey,fontSize: 12)

                            ),
                          ],
                        ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: ColorApp.primary,
                          shape: BoxShape.circle
                        ),
                        child:const Center(child: Text('3',style: TextStyle(color: Colors.white),),),
                      ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

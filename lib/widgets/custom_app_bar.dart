import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/view/messages/views/chat_view.dart';
import 'package:vc/widgets/rating.dart';
import '../controller/myController.dart';
import 'arrow_back_icons.dart';

class CustomAppbar extends StatelessWidget {
  final dynamic image;
  final String serviceName;
  final double rating;

  CustomAppbar(
      {Key? key,
      required this.image,
      required this.serviceName,
      required this.rating})
      : super(key: key);
  final controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    return Container(
      height: screenUtil.setHeight(250),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/png/service.png'),
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ArrowBackIcon(
                  color: Colors.white,
                  ontap: () {
                    Get.back();
                  },
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                      () => ChatView(),
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 1000),
                    );
                  },
                  child: Container(
                    width: screenUtil.setWidth(30),
                    height: screenUtil.setHeight(30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage('assets/icons/b3.png'),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Container(
                  width: screenUtil.setWidth(80),
                  height: screenUtil.setHeight(85),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffB9FFC0),
                      image: DecorationImage(image: image, fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: screenUtil.setWidth(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceName,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                    CustomRating(
                      textColor: Colors.white,
                      initialRating: rating,
                      serviceID: 1,
                      size: 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

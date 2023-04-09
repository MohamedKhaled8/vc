import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/theme/constant/sized.dart';
import 'package:vc/view/home_view/home.dart';

class PopUp extends StatelessWidget {
  final String? title;
  final String titleFristChat;
  final String titlePartTwo;
  final String image;
  final String? orderID;
  final String btnText;

  const PopUp({
    super.key,
    this.title,
    required this.image,
    this.orderID,
    required this.btnText,
    required this.titleFristChat,
    required this.titlePartTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      child: Container(
        height: orderID != null
            ? screenUtil.setHeight(490)
            : screenUtil.setHeight(391),
        width: screenUtil.setWidth(290),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 30),
                child: title == null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Text(
                              titleFristChat,
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                                color: ColorApp.primary,
                              ),
                            ),
                          ),
                          Text(
                            titlePartTwo.toUpperCase(),
                            style: TextStyle(
                              fontSize: 16.3,
                              fontWeight: FontWeight.w700,
                              color: ColorApp.primary,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        title ?? '',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: ColorApp.primary,
                        ),
                      )),
            LottieBuilder.asset(image),
            orderID != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Order Code :  ',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: ColorApp.grey,
                        ),
                      ),
                      Text(
                        orderID!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: ColorApp.primary,
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            InkWell(
              onTap: () {
                Get.offAll(() => const HomeView());
              },
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                height: screenUtil.setHeight(46),
                width: screenUtil.setWidth(250),
                decoration: BoxDecoration(
                    color: ColorApp.primary,
                    borderRadius: BorderRadius.circular(11)),
                child: Text(
                  btnText,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vc/theme/extensions/extensions.dart';

class CircleCard extends StatelessWidget {
  const CircleCard({
    super.key,
    required this.screenUtil,
  });

  final ScreenUtil screenUtil;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: screenUtil.setHeight(70),
                  width: screenUtil.setWidth(70),
                  decoration: BoxDecoration(
                      color: const Color(0xff20843C)
                          .withOpacity(0.2),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage(
                            "assets/icons/deep cleaning.png"),
                      )),
                ),
              ),
              const Text(
                "deep cleaning ",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
         10.pw,
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: screenUtil.setHeight(70),
                  width: screenUtil.setWidth(70),
                  decoration: BoxDecoration(
                      color: const Color(0xffB9D9FF)
                          .withOpacity(0.7),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage(
                            "assets/icons/car cleaning.png"),
                      )),
                ),
              ),
              const Text(
                "car cleaning ",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            width: screenUtil.setWidth(10),
          ),
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: screenUtil.setHeight(70),
                  width: screenUtil.setWidth(70),
                  decoration: BoxDecoration(
                      color: const Color(0xffF6DEAF)
                          .withOpacity(0.5),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage(
                            "assets/icons/painting.png"),
                      )),
                ),
              ),
              const Text(
                "painting ",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            width: screenUtil.setWidth(10),
          ),
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: screenUtil.setHeight(70),
                  width: screenUtil.setWidth(70),
                  decoration: BoxDecoration(
                      color: const Color(0xff9500C9)
                          .withOpacity(0.3),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage(
                            "assets/icons/dish washing.png"),
                      )),
                ),
              ),
              const Text(
                "dish washing ",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            width: screenUtil.setWidth(10),
          ),
         
         
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: screenUtil.setHeight(70),
                  width: screenUtil.setWidth(70),
                  decoration: BoxDecoration(
                      color: const Color(0xff20843C)
                          .withOpacity(0.2),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage(
                            "assets/icons/deep cleaning.png"),
                      )),
                ),
              ),
              const Text(
                "deep cleaning ",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
           SizedBox(
            width: screenUtil.setWidth(10),
          ),
             Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: screenUtil.setHeight(70),
                  width: screenUtil.setWidth(70),
                  decoration: BoxDecoration(
                      color: const Color(0xffB9D9FF)
                          .withOpacity(0.7),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage(
                            "assets/icons/car cleaning.png"),
                      )),
                ),
              ),
              const Text(
                "car cleaning ",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

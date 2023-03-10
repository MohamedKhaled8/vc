import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/widgets/container_shadow.dart';
import 'package:vc/widgets/rating.dart';
import '../../controller/myController.dart';

class CardDetailsView extends StatelessWidget {
  const CardDetailsView({
    super.key,
    required this.screenUtil,
    required this.controller,
  });

  final ScreenUtil screenUtil;
  final MyController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: screenUtil.setWidth(270),
      height: screenUtil.setHeight(160),
      decoration: buildShadowContainer(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: screenUtil.setHeight(60),
                        width: screenUtil.setWidth(60),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/jpeg/mohamed.jpeg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      10.pw,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Customer name", style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),),
                          5.ph,
                      CustomRating(),
                          15.ph,
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit amet, consectetur adipiscing elit. ",
              maxLines: 4,
              overflow:
              TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

}
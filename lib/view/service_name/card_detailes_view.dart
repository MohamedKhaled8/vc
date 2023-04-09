import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vc/widgets/container_shadow.dart';
import 'package:vc/widgets/rating.dart';
import '../../controller/myController.dart';
import 'package:vc/model/services_model/user_home_model.dart';

class ReviewCardDetails extends StatelessWidget {
  final Review reviewInfo;
  ReviewCardDetails({
    super.key,
    required this.screenUtil,
    required this.controller,
    required this.reviewInfo,
  });

  final ScreenUtil screenUtil;
  final MyController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: screenUtil.setWidth(270),
      height: screenUtil.setHeight(130),
      decoration: buildShadowContainer(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: setImage(index: 0), fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: screenUtil.setWidth(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            reviewInfo.user![0].name!,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(10),
                          ),
                          CustomRating(
                            textColor: Colors.black,
                            initialRating: reviewInfo.rating!.toDouble(),
                            serviceID: reviewInfo.id!,
                            size: 25,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              reviewInfo.comments!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  dynamic setImage({required int index}) {
    if (reviewInfo.user![0].photo!.length > 1 &&
        reviewInfo.user![0].photo!.contains('http')) {
      return NetworkImage(reviewInfo.user![0].photo!);
    } else {
      return const AssetImage('assets/images/png/user.png');
    }
  }
}

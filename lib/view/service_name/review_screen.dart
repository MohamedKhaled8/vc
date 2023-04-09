import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/theme/constant/sized.dart';
import 'package:vc/widgets/custom_appbar_two.dart';
import '../../controller/myController.dart';
import 'card_detailes_view.dart';
import 'package:vc/model/services_model/user_home_model.dart';

class ReviewScreen extends StatelessWidget {
  final controller = Get.put(MyController());
  final List<Review> reviewInfo;
  ReviewScreen({Key? key, required this.reviewInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            DefaultAppBar(
              110,
              text: 'Reviews',
              onTap: () {
                Get.back();
              },
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: reviewInfo.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return ReviewCardDetails(
                      reviewInfo: reviewInfo[index],
                      screenUtil: screenUtil,
                      controller: controller,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

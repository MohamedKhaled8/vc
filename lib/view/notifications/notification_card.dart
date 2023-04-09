import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/controller/myController.dart';
import 'package:vc/model/model_card.dart';
import 'package:vc/model/notifications_model.dart';
import 'package:vc/theme/constant/const_colors.dart';

class NotificationsCard extends StatelessWidget {
  final NotificationsModel? notificationsmodel;

  NotificationsCard({super.key, this.notificationsmodel});
  final controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: screenUtil.setHeight(85),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: Transform.scale(
          scale: 1.25,
          child: Container(
            margin: const EdgeInsets.only(left: 6),
            padding: const EdgeInsets.all(3),
            //height: screenUtil.setHeight(90),
            decoration: BoxDecoration(
              color: ColorApp.fav,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/icons/cleaning 1.png',
            ),
          ),
        ),
        title: Text(
          'Moahmed Elsafty',
          style: TextStyle(
            color: ColorApp.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text('aaaaaaaaaaaaaaaaaaaa'),
        trailing: Padding(
          padding: const EdgeInsets.only(bottom: 24, right: 10),
          child: Text(
            '10 hours ago',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

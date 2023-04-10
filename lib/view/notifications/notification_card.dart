import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vc/theme/constant/const_colors.dart';
import '../../model/notification_model.dart';

class NotificationsCard extends StatelessWidget {
  final Data notificationData;

  const NotificationsCard({super.key, required this.notificationData});

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 5),
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
          notificationData.title.toString(),
          style: TextStyle(
            color: ColorApp.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(notificationData.body.toString()),
        trailing: Padding(
          padding: EdgeInsets.only(bottom: 24, right: 10),
          child: Text(
            notificationData.createdAt.toString(),
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

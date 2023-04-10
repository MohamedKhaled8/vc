import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/controller/notification_controller.dart';
import 'package:vc/model/notification_model.dart';
import 'package:vc/model/notifications_model.dart';
import 'package:vc/view/notifications/notification_card.dart';

import 'package:vc/widgets/custom_containert_top_screen.dart';

import '../../helper/end_points.dart';
import '../../theme/constant/sized.dart';

class NotificationsView extends StatelessWidget {
  NotificationsView({super.key});

  final NotificationController notificationController =
      NotificationController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffD9D9D9),
      body: Column(
        children: [
          Stack(
            children: [
              CustomContainerTopScreen(
                  ontap: () {
                    Get.back();
                  },
                  text: "Notifications",
                  size: 120,
                  screenUtil: screenUtil)
            ],
          ),
          FutureBuilder(
              future: notificationController.notification(
                  context: context, url: EndPointName.NOTIFICATIONS),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                  final NotificationModel notificationModel = snapshot.data as NotificationModel;
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return NotificationsCard(
                          notificationData: notificationModel.data![index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox();
                      },
                      itemCount: notificationModel.data!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }),
        ],
      ),
    ));
  }
}

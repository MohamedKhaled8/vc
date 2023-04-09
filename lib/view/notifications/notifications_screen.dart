import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/model/notifications_model.dart';
import 'package:vc/view/notifications/notification_card.dart';

import 'package:vc/widgets/custom_containert_top_screen.dart';

import '../../theme/constant/sized.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

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
          // NotificationsCard(notificationsmodel: notificationsmodel[0],)
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return NotificationsCard(
                  notificationsmodel: notificationsmodel[index],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox();
              },
              itemCount: notificationsmodel.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    ));
  }
}

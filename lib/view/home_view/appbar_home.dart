import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/view/transport_view/service%20_name_transportr.dart';
import 'package:vc/view/notifications/notifications_screen.dart';
import 'package:vc/view/user_profile/user_profile.dart';

class AppBarHome extends StatelessWidget {
  final String? userName;
  final String? userImage;
  final bool user;
  const AppBarHome({
    super.key,
    this.userName,
    this.userImage,
    required this.screenUtil,
    required this.user,
  });

  final ScreenUtil screenUtil;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            checkNameLength(userName: userName ?? ''),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Need Some Help ?",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ]),
        const Spacer(),
        user
            ? InkWell(
                onTap: () {
                  Get.to(
                    const NotificationsView(),
                    transition: Transition.zoom,
                    duration: const Duration(milliseconds: 1000),
                  );
                },
                child: Container(
                  height: screenUtil.setHeight(50),
                  width: screenUtil.setWidth(50),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/icons/bell.png"))),
                ),
              )
            : const SizedBox(),
        InkWell(
          onTap: () {
            if (user) {
              Get.to(
                UserProfile(),
                transition: Transition.leftToRight,
                duration: const Duration(milliseconds: 1000),
              );
            } else {
              Get.to(
                () => ServiceNameTransport(),
                transition: Transition.leftToRight,
                duration: const Duration(milliseconds: 1000),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 0.8,
                )),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: setImage(),
              backgroundColor: Colors.transparent,
            ),
          ),
        )
      ],
    );
  }

  ImageProvider<Object>? setImage() {
    if (userImage != null && userImage!.contains('http')) {
      return NetworkImage(userImage!);
    } else {
      return AssetImage(userImage!);
    }
  }

  String checkNameLength({required String userName}) {
    if (userName.length > 13) {
      return '${userName.substring(0, 11)}...';
    } else {
      return userName;
    }
  }
}

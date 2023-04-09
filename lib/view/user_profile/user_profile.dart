import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/controller/authentication_controller/profile_controller.dart';
import 'package:vc/model/auth/profile_model.dart';
import 'package:vc/view/user_profile/top_buttons.dart';
import 'package:vc/view/user_profile/user_profile_card.dart';
import 'package:vc/widgets/custom_containert_top_screen.dart';
import '../../../theme/constant/const_colors.dart';
import '../../model/services_model/user_home_model.dart';
import '../home_view/favorite_list_screen.dart';
import '../payment/payment_setting_screen.dart';

class UserProfile extends StatelessWidget {
  final Service? serviceModel;
  final profileController = Get.put(ProfileController());
  String? userImage;

  UserProfile({super.key, this.serviceModel});

  final ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: profileController.profile(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final ProfileModel data = snapshot.data as ProfileModel;
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CustomContainerTopScreen(
                        text: "User Profile",
                        screenUtil: screenUtil,
                        size: 215,
                      ),
                      Positioned(
                        left: 114,
                        top: 133,
                        child: Container(
                          height: screenUtil.setHeight(176),
                          width: screenUtil.setWidth(176),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 3,
                                blurRadius: 3,
                                color: Colors.grey.withOpacity(0.5),
                                offset: const Offset(0, 3),
                              ),
                            ],
                            image: DecorationImage(
                              image: setImage(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenUtil.setHeight(10),
                ),
                Text(
                  data.userData.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: screenUtil.setHeight(5),
                ),
                Text(
                  data.userData.email,
                  style: const TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: screenUtil.setHeight(35),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TopButtons(
                        text: 'Favorite\nList',
                        image: 'assets/icons/lovepersn.png',
                        cardColor: ColorApp.fav,
                        onTapFunx: () {
                          Get.to(
                            () => FavoriteListScreen(
                              serviceModel: serviceModel!,
                            ),
                            transition: Transition.zoom,
                            duration: const Duration(milliseconds: 1000),
                          );
                        }),
                    TopButtons(
                      text: 'Payment\nSettings',
                      image: 'assets/icons/payment1.png',
                      cardColor: ColorApp.payment,
                      onTapFunx: () {
                        Get.to(
                          () => PaymentSettingScreen(),
                          transition: Transition.zoom,
                          duration: const Duration(milliseconds: 1000),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: screenUtil.setHeight(30),
                ),
                UserProfileCard(
                  // data: data,
                  size: size,
                  screenUtil: screenUtil,
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        }),
      ),
    );
  }

  ImageProvider<Object> setImage() {
    if (userImage != null && userImage!.contains('http')) {
      return NetworkImage(userImage!);
    } else {
      return const AssetImage('assets/images/png/user.png');
    }
  }
}

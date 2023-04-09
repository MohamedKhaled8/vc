import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/controller/favorite_controller.dart';
import 'package:vc/model/top_service_model.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/view/service_name/service_name_screen.dart';
import 'package:vc/widgets/rating.dart';

import '../controller/myController.dart';
import '../model/services_model/user_home_model.dart';

class ActionCard extends StatelessWidget {
  final TopServiceModelCard topServiceModel;
  final Service serviceModel;
  final bool? is_favorite;
  ActionCard(
      {super.key,
      required this.topServiceModel,
      required this.serviceModel,
      this.is_favorite});

  final controller = Get.put(MyController());
  final FavoriteController _favoController = FavoriteController();

  @override
  Widget build(BuildContext context) {
    bool _is_favorite = is_favorite ?? topServiceModel.is_favorite;

    ScreenUtil screenUtil = ScreenUtil();
    return InkWell(
      onTap: () {
        Get.to(
          ServiceNameScreen(
            serviceModel: serviceModel,
            isfavorite: _is_favorite,
          ),
          transition: Transition.zoom,
          duration: const Duration(milliseconds: 1000),
        );
      },
      child: Container(
        height: screenUtil.setHeight(125),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenUtil.setHeight(110),
              width: screenUtil.setWidth(90),
              margin: const EdgeInsets.only(left: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffB9FFC0)),
              child: setImage() != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: setImage(),
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox(),
            ),
            SizedBox(
              width: screenUtil.setWidth(20),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  checkNameLength(serviceName: topServiceModel.title),
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "${topServiceModel.price}  / hr",
                    style: TextStyle(color: ColorApp.primary),
                  ),
                ),
                CustomRating(
                  textColor: Colors.black,
                  initialRating: topServiceModel.rate.toDouble(),
                  serviceID: topServiceModel.id,
                  size: 25,
                ),
              ],
            ),
            SizedBox(width: screenUtil.setWidth(55)),
            GetBuilder<MyController>(builder: (controller) {
              return FavoriteButton(
                isFavorite: topServiceModel.is_favorite,
                iconSize: 45,
                valueChanged: (value) {
                  _is_favorite = value;
                  if (value) {
                    _favoController.addFavorite('en', context: context,
                        serviceId: topServiceModel.id.toString());
                  } else {
                    _favoController.deleteFavorite(context: context,
                      id: topServiceModel.id.toString(),
                    );
                  }
                },
              );
            })
          ],
        ),
      ),
    );
  }

  dynamic setImage({int? index}) {
    if (topServiceModel.image != null &&
        topServiceModel.image.contains('http')) {
      return NetworkImage(topServiceModel.image);
    }
  }

  String checkNameLength({required String serviceName}) {
    if (serviceName.length > 15) {
      return '${serviceName.substring(0, 13)}...';
    } else {
      return serviceName;
    }
  }
}

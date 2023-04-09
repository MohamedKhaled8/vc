import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/model/services_model/user_home_model.dart';
import 'package:vc/view/service_name/service_name_screen.dart';

class CircleCard extends StatelessWidget {
  final List<Service> serviceList;
  const CircleCard({
    super.key,
    required this.screenUtil,
    required this.serviceList,
  });

  final ScreenUtil screenUtil;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenUtil.setHeight(100),
      width: screenUtil.screenWidth,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: serviceList.length,
        itemBuilder: (context, index) {
          if (index >= serviceList.length - 1 ||
              _colorIndex >= _colors.length - 1) {
            _colorIndex -= _colorIndex;
          } else {
            _colorIndex++;
          }
          return InkWell(
            onTap: () {
              Get.to(
                ServiceNameScreen(
                  serviceModel: serviceList[index],
                ),
                transition: Transition.zoom,
                duration: const Duration(milliseconds: 1000),
              );
            },
            child: Column(
              children: [
                Container(
                  height: screenUtil.setHeight(70),
                  width: screenUtil.setWidth(70),
                  decoration: BoxDecoration(
                    color: _colors[_colorIndex],
                    shape: BoxShape.circle,
                  ),
                  child: setImage(index: index) != null
                      ? CircleAvatar(
                          backgroundImage: setImage(index: index),
                        )
                      : SizedBox(
                          height: screenUtil.setHeight(90),
                        ),
                ),
                Text(
                  checkTitleLength(index: index),
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: screenUtil.setWidth(10),
        ),
      ),
    );
  }

  dynamic setImage({required int index}) {
    if (serviceList[index].images != null &&
        serviceList[index].images!.contains('http')) {
      return NetworkImage(serviceList[index].images!);
    }
  }

  String checkTitleLength({required int index}) {
    if (serviceList[index].title!.length > 12) {
      return '${serviceList[index].title!.substring(0, 11)}...';
    } else {
      return serviceList[index].title!;
    }
  }
}

int _colorIndex = -1;
List<Color> _colors = [
  const Color(0xffB9FFC0),
  const Color(0xffB9D9FF).withOpacity(0.7),
  const Color(0xffF6DEAF).withOpacity(0.5),
  const Color(0xff9500C9).withOpacity(0.3)
];

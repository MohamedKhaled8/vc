import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/controller/requriment_controller.dart';
import 'package:vc/controller/user_home_controller.dart';
import 'package:vc/model/requirement_model.dart';
import 'package:vc/model/services_model/subService_model.dart';

import '../../theme/constant/const_colors.dart';

class OnceWeekMonthBtn extends StatelessWidget {
  final bool isSelected;
  final String title;

  OnceWeekMonthBtn({
    Key? key,
    required this.isSelected,
    required this.title,
  }) : super(key: key);
  final UserHomeController serviceController = Get.put(UserHomeController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    return Container(
      width: MediaQuery.of(context).size.width / 3 - 20,
      height: screenUtil.setHeight(40),
      decoration: BoxDecoration(
        color: isSelected ? ColorApp.primary : Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
              color: Color(0x33000000),
              offset: Offset(0, 0),
              blurRadius: 8,
              spreadRadius: 0)
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: isSelected
              ? const TextStyle(color: Colors.white, fontSize: 14)
              : TextStyle(color: ColorApp.primary, fontSize: 14),
        ),
      ),
    );
  }
}

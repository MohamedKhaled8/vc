import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/view/home_view/search_bar_tems.dart';

import '../model/services_model/user_home_model.dart';
import '../theme/constant/const_colors.dart';

class SearchBar extends StatelessWidget {
  final List<Service>? shearchServiceLsit;
  final double? iconSize;
  const SearchBar({
    super.key,
    required this.screenUtil,
    this.shearchServiceLsit,
    this.iconSize = 35,
  });

  final ScreenUtil screenUtil;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenUtil.setHeight(55),
      child: Form(
          child: TextFormField(
        onTap: () {
          Get.to(
            SearchBarFromItems(
              serviceList: shearchServiceLsit ?? [],
            ),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 700),
          );
        },
        cursorColor: Colors.green,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search_outlined,
            color: ColorApp.primary,
            size: iconSize,
          ),
          hintText: 'find it here ..........',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade200, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.green.shade200, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: Colors.red),
          ),
          contentPadding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto",
            fontStyle: FontStyle.normal,
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      )),
    );
  }
}

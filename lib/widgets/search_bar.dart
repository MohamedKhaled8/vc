import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/constant/const_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.screenUtil,
  });

  final ScreenUtil screenUtil;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenUtil.setHeight(55),
      child: Form(
          child: TextFormField(
        cursorColor: Colors.green,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search_outlined,
            color: ColorApp.primary,
            size: 35,
          ),
          hintText: 'find it here ..........',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.green.shade200, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Colors.green.shade200, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                width: 1, color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                width: 1, color: Colors.red),
          ),
          contentPadding:
              const EdgeInsets.fromLTRB(22, 18, 22, 18),
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
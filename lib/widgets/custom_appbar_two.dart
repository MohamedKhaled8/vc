import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/extensions/extensions.dart';
import '../theme/constant/const_colors.dart';
import 'arrow_back_icons.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  final String text;
  final Function() onTap;
  double height = 120;

  DefaultAppBar(this.height,
      {Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenUtil screenUtil = ScreenUtil();
    return PreferredSize(
      preferredSize: Size.fromHeight(screenUtil.setHeight(height)),
      child: AppBar(
        elevation: 0,
        backgroundColor: ColorApp.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        leading: ArrowBackIcon(color: Colors.white, ontap: onTap),
        title: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

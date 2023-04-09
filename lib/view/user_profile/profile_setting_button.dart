import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vc/theme/constant/const_colors.dart';

import '../../widgets/cutom_buttom_two.dart';

class ProfileSettingButton extends StatelessWidget {
  final String btnText;
  final bool logout;
  final VoidCallback? onTap;
  const ProfileSettingButton({
    super.key,
    required this.screenUtil,
    required this.size,
    required this.btnText,
    this.logout = false,
    this.onTap,
  });

  final ScreenUtil screenUtil;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenUtil.setHeight(50),
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: logout ? Colors.transparent : Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: CustomButtonTWo(
          screenUtil: screenUtil,
          color: ColorApp.primary,
          color1: Colors.white,
          txt: btnText,
          onTap: () {
            onTap;
          },
        ),
      ),
    );
  }
}

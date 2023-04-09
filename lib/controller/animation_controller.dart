import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/theme/constant/const_colors.dart';

class Animation_Controller extends GetxController {
  double scale = 1.0;
  bool loderShow = false;

  Color? currentGreenColor = ColorApp.primary;
  Color? currentBlueColor = ColorApp.buttonBlue;
  bool test = false;
  ScaleAnimation_TapDown_Up({double maxScale = 1.15}) {
    scale == 1.0 ? scale = maxScale : scale = 1.0;
    update();
  }

  loder() {
    loderShow ? loderShow = false : loderShow = true;
    update();
  }

  hover() {
    if (test) {
      test = false;
    } else {
      test = true;
    }
    update();
  }
}

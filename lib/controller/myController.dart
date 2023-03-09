import 'package:get/get.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
class MyController extends GetxController {
  bool isShowMore = true;
  // bool isStar = false;
  // void isStare() {
  //   isStar = !isStar;
  //   update();
  // }

void isShowMoree () {
  isShowMore = !isShowMore;
      update();
}
   
  @override
  void onInit() {
    // isStare();
    isShowMoree ();
    super.onInit();
  }

}

import 'package:get/get.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
class MyController extends GetxController {
  bool isShowMore = true;
  bool isStar = false;
  void isStare() {
    isStar = !isStar;
    update();
  }

void isShowMoree () {
  isShowMore = !isShowMore;
      update();
}
   
  @override
  void onInit() {
    isStare();
    isShowMoree ();
    super.onInit();
  }
  File? image;
  Future pickImage() async {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      update();
      if(image==null) return;
      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      update();
    }on PlatformException catch(error){
      print('Failed to pick image $error');
    }
    update();

  }
}

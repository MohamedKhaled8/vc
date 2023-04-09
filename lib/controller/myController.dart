import 'package:get/get.dart';

class MyController extends GetxController {
  bool isShowMore = true;

  bool favoriut = false;

  // RxBool checkFavoriut({required bool is_favioret}) {
  //   if (is_favioret == 0) {
  //     favoriut = false.obs;
  //     return favoriut;
  //   } else {
  //     favoriut = true.obs;
  //     return favoriut;
  //   }
  // }

  void isShowMoree() {
    isShowMore = !isShowMore;
    update();
  }

  bool isPressed = false;
  void favo() {
    isPressed = !isPressed;
    update();
  }

  @override
  void onInit() {
    // isStare();
    isShowMoree();
    super.onInit();
  }
}

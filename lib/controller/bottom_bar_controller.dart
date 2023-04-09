import 'package:get/get.dart';

class ChatBottomBarController extends GetxController {
  bool showEmogis = false;
  String selectedEmoji = '';

  bool msgLen = false;

  checkMsgLen({required int textLen}) {
    if (textLen > 0) {
      msgLen = true;
    } else {
      msgLen = false;
    }
    update();
  }

  void emojisShow_Off() {
    if (showEmogis) {
      showEmogis = false;
    } else {
      showEmogis = true;
    }
    update();
  }
}

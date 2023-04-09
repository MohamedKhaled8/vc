import 'package:get/get_state_manager/get_state_manager.dart';

class ChangeCardController extends GetxController {
  bool isSelected = false;
  int cardSelected = 0;
  void checkSelected({required int cardIndex, required bool active}) {
    isSelected = active;
    cardSelected = cardIndex;

    update();
  }
}

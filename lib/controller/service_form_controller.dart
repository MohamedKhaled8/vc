import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServiceFormController extends GetxController {
  final ScreenUtil screenUtil = ScreenUtil();

  RangeValues? workArea;
  String orderDate = '';
  String orderTime = '';

  bool onceBtn = true;
  bool weekly = false;
  bool monthly = false;
  String repeatService = '';

  Map selectedExtraService = {};

  void selectRepeatBtn({
    required int btnNum,
  }) {
    if (btnNum == 1 && onceBtn == true) {
      onceBtn = true;
      weekly = false;
      monthly = false;
      repeatService = 'Once';
    } else if (btnNum == 1 && onceBtn == false) {
      onceBtn = true;
      weekly = false;
      monthly = false;
      repeatService = 'Once';
    }

    if (btnNum == 2 && weekly == true) {
      onceBtn = false;
      weekly = true;
      monthly = false;
      repeatService = 'Weekly';
    } else if (btnNum == 2 && weekly == false) {
      onceBtn = false;
      weekly = true;
      monthly = false;
      repeatService = 'Weekly';
    }
    if (btnNum == 3 && monthly == true) {
      onceBtn = false;
      weekly = false;
      monthly = true;
      repeatService = 'Monthly';
    } else if (btnNum == 3 && monthly == false) {
      onceBtn = false;
      weekly = false;
      monthly = true;
      repeatService = 'Monthly';
    }
    update();
  }

  Map<String, bool> extraService = {
    'Cooking( 20\$ )': false,
    'Once( 15\$ )': false,
    'Cooking( 16\$ )': false,
    'Windows( 15\$ )': false,
    'dish washing( 35\$ )': false,
  };
  void selectExtraService({
    required String btnName,
  }) {
    if (extraService[btnName]!) {
      extraService[btnName] = false;
      selectedExtraService.remove(btnName);
    } else {
      extraService[btnName] = true;
      selectedExtraService.addAll({btnName: btnName});
    }
    update();
  }

  int roomNum = 0;
  int bathroomNum = 0;
  int kitchenNum = 0;

  int roomTotalPrice = 0;
  int bathroomTotalPrice = 0;
  int kitchenTotalPrice = 0;

  roomPlus({required int btnNum, required int price}) {
    if (btnNum == 1) {
      roomNum++;
      roomTotalPrice = roomNum * price;
    } else if (btnNum == 2) {
      bathroomNum++;
      bathroomTotalPrice = bathroomNum * price;
    } else if (btnNum == 3) {
      kitchenNum++;
      kitchenTotalPrice = kitchenNum * price;
    }
    update();
  }

  roomMinus({required int btnNum, required int price}) {
    if (btnNum == 1) {
      roomNum--;
      roomTotalPrice = roomNum * price;
    } else if (btnNum == 2) {
      bathroomNum--;
      bathroomTotalPrice = bathroomNum * price;
    } else if (btnNum == 3) {
      kitchenNum--;
      kitchenTotalPrice = kitchenNum * price;
    }
    update();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/controller/service_form_controller.dart';

import '../../theme/constant/const_colors.dart';
import '../../widgets/container_shadow.dart';

class BuildOtherItems extends StatelessWidget {
  final String roomName;
  final String roomPrice;
  final int btnNum;
  final int price;
  BuildOtherItems(
      {Key? key,
        required this.roomName,
        required this.roomPrice,
        required this.btnNum,
        required this.price
      })
      : super(key: key);
  final ScreenUtil screenUtil = ScreenUtil();
  final ServiceFormController controller = Get.put(ServiceFormController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black, fontSize: 35),
            children: <TextSpan>[
              TextSpan(
                text: roomName,
                style: const TextStyle(
                  fontSize: 35,
                ),
              ),
              TextSpan(
                text: roomPrice,
                style: const TextStyle(fontSize: 27, color: Colors.grey),
              ),
            ],
          ),
          textScaleFactor: 0.5,
        ),
        Container(
          height: screenUtil.setHeight(40),
          width: screenUtil.setWidth(135),
          decoration:
          buildShadowContainer(borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  if (_setNumber(btnNum: btnNum)! > 0) {
                    controller.roomMinus(
                      btnNum: btnNum,
                      price: price,
                    );
                  }
                },
                child: Container(
                  height: screenUtil.setHeight(40),
                  width: screenUtil.setWidth(40),
                  decoration: BoxDecoration(
                    color: ColorApp.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Image.asset('assets/icons/minus.png'),
                  ),
                ),
              ),
              Text('${_setNumber(btnNum: btnNum)}'),
              InkWell(
                onTap: () {
                  controller.roomPlus(
                    btnNum: btnNum,
                    price: price,
                  );
                },
                child: Container(
                  height: screenUtil.setHeight(40),
                  width: screenUtil.setWidth(40),
                  decoration: BoxDecoration(
                    color: ColorApp.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Image.asset('assets/icons/add.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  num? _setNumber({required num btnNum}) {
    if (btnNum == 1) {
      return controller.roomNum;
    } else if (btnNum == 2) {
      return controller.bathroomNum;
    } else if (btnNum == 3) {
      return controller.kitchenNum;
    }
  }
}
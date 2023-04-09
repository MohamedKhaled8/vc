import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/controller/payment_controller.dart';
import 'package:vc/view/payment/add_payment_card.dart';

import '../../../theme/constant/const_colors.dart';

class AddAddress_Btn extends StatelessWidget {
  const AddAddress_Btn({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    final PaymentController _controller = PaymentController();
    return InkWell(
      onTap: () {
        Get.to(AddPaymentCard(),
            transition: Transition.zoom,
            duration: const Duration(milliseconds: 1000));
      },
      child: Container(
        width: screenUtil.setWidth(200),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(width: 2.5, color: ColorApp.primary),
          borderRadius: BorderRadius.circular(6),
        ),
        child: InkWell(
          onTap: () async {
            Get.to(
              AddPaymentCard(),
              transition: Transition.leftToRight,
              duration: const Duration(milliseconds: 1000),
            );
          },
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.5, color: ColorApp.primary),
                ),
                child: Center(
                    child: Icon(
                  Icons.add,
                  color: ColorApp.primary,
                )),
              ),
              SizedBox(
                width: screenUtil.setWidth(15),
              ),
              Text(
                '  Add Payment Card',
                style: TextStyle(color: ColorApp.primary, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

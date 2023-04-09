import 'package:flutter/material.dart';
import 'package:vc/widgets/popup.dart';

import '../../../theme/constant/const_colors.dart';
import '../../../theme/constant/sized.dart';
import '../../../widgets/container_shadow.dart';
import '../../../widgets/cutom_buttom_two.dart';

class Buttom_Bar extends StatelessWidget {
  const Buttom_Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenUtil.setHeight(50),
      width: double.infinity,
      decoration: buildShadowContainer(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: CustomButtonTWo(
          screenUtil: screenUtil,
          color: ColorApp.primary,
          color1: Colors.white,
          txt: 'Payment confirmation',
          onTap: () async {
            await showDialog(
              context: context,
              builder: (context) => Container(
                margin: const EdgeInsets.only(bottom: 150),
                child: const PopUp(
                  titleFristChat: 'P',
                  titlePartTwo: 'PAYMENT SUCCESSFULLY',
                  image: 'assets/images/json/success_payment.json',
                  orderID: '165498753',
                  btnText: 'Done',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../theme/constant/const_colors.dart';
import '../../../theme/constant/sized.dart';
import '../../../widgets/container_shadow.dart';

class PriceOrderCard extends StatelessWidget {
  final Map orderInfo;

  const PriceOrderCard({super.key, required this.orderInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenUtil.setWidth(315),
          height: screenUtil.setHeight(130),
          decoration: buildShadowContainer(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 15, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Price Summary',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorApp.primary,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cleaning',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff1C1C21),
                    ),
                  ),
                  Text(
                    '${orderInfo['totalPrice']} \$',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1C1C21),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Discount',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff1C1C21),
                    ),
                  ),
                  Text(
                    r'0 $',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1C1C21),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        Container(
            height: screenUtil.setHeight(48),
            width: screenUtil.setWidth(315),
            decoration: BoxDecoration(
              color: ColorApp.primary,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    r'35$',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

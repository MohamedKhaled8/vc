// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vc/controller/order/order_controller.dart';

import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/widgets/cutom_buttom_two.dart';

class OrderDetailesBottomNavigationBar extends StatelessWidget {
  const OrderDetailesBottomNavigationBar({
    Key? key,
    required this.screenUtil,
    required this.size,
    required this.txt,
  }) : super(key: key);

  final ScreenUtil screenUtil;
  final Size size;
  final String txt;

  @override
  Widget build(BuildContext context) {
    final OrderController _controller = OrderController();
    return Container(
      height: screenUtil.setHeight(60),
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0, 3),
              spreadRadius: 3,
              blurRadius: 5,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: CustomButtonTWo(
          screenUtil: screenUtil,
          color: ColorApp.primary,
          color1: Colors.white,
          txt: txt,
          onTap: () async {
            // await _controller.addOrder(
            //   context: context,
            //   workArea: '35',
            //   date: '02/03/2023',
            //   time: '10:50',
            //   address: 'Alex',
            //   repeat: 'once',
            //   serviceId: '1',
            //   subService: [],
            // );
            // Get.back();
          },
        ),
      ),
    );
  }
}

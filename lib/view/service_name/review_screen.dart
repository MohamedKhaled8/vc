import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/widgets/custom_appbar_two.dart';

import '../../controller/myController.dart';
import '../../theme/constant/const_colors.dart';
import 'card_detailes_view.dart';

class ReviewScreen extends StatelessWidget {
  final controller = Get.put(MyController());
final  ScreenUtil screenUtil = ScreenUtil();

   ReviewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          CustomAppBarOne(110, text: 'Reviews',),
          Expanded(child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: 10,
            itemBuilder: (context,index)=>CardDetailsView(screenUtil: screenUtil, controller: controller)),),

        ],
      ),
    );
  }
}
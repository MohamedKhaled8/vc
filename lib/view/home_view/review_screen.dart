import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/view/home_view/detailes_screen_view.dart';
import 'package:vc/widgets/arrow_back_icons.dart';
import 'package:vc/widgets/custom_appbar_two.dart';

import '../../controller/myController.dart';

class ReviewScreen extends StatelessWidget {
  final controller = Get.put(MyController());
final  ScreenUtil screenUtil = ScreenUtil();

   ReviewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          CustomAppBarTwo(110, text: 'Reviews',),
          Expanded(child: ListView.builder(
            padding: EdgeInsets.all(10),
              itemCount: 10,
              itemBuilder: (context,index)=>buildCardItem(),),),

        ],
      ),
    );
  }
  buildCardItem(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(
                    0, 3), // changes position of shadow
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: screenUtil.setHeight(40),
                    width: screenUtil.setWidth(40),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/jpeg/mohamed.jpeg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: screenUtil.setWidth(10),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Eyad Saad'),
                      GetBuilder<MyController>(builder: (_) {
                        return InkWell(
                          onTap: () {
                            controller.isStare();
                          },
                          child: Row(
                            children: [
                              controller.isStar == false
                                  ? const Icon(
                                Icons.star,
                                size: 20,
                              )
                                  : const Icon(Icons.star,
                                  color: Colors.yellow, size: 20),
                              controller.isStar == false
                                  ? const Icon(
                                Icons.star,
                                size: 20,
                              )
                                  : const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              controller.isStar == false
                                  ? const Icon(
                                Icons.star,
                                size: 20,
                              )
                                  : const Icon(Icons.star,
                                  color: Colors.yellow, size: 20),
                              controller.isStar == true
                                  ?  Icon(
                                Icons.star,
                                size: 20,
                                color: ColorApp.starFalse,
                              )
                                  : const Icon(Icons.star,
                                  color: Colors.yellow, size: 20),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum mollis '),
            ],
          ),
        ),
      ),
    );
  }
}
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/constant/const_colors.dart';
import '../../controller/myController.dart';
import '../../widgets/arrow_back_icons.dart';
import '../../widgets/card_detailes_view.dart';
import '../../widgets/custom_buttom_navbar.dart';

class DetailsView extends StatelessWidget {
  DetailsView({
    Key? key,
  }) : super(key: key);
  final controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: screenUtil.setHeight(300),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/png/background.png"),
                fit: BoxFit.cover,
              )),
            ),
          ),
          Positioned(
            left: 10,
            top: 20,
            child: Row(
              children: const [
                ArrowBackIcon(
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Positioned(
            top: 190,
            child: Container(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 30),
              width: MediaQuery.of(context).size.width,
              height: screenUtil.setHeight(800),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "deep cleaning ",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "15 \$ hr",
                          style:
                              TextStyle(color: ColorApp.primary, fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(height: screenUtil.setHeight(20)),
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
                                    size: 35,
                                  )
                                : const Icon(Icons.star,
                                    color: Colors.yellow, size: 35),
                            controller.isStar == false
                                ? const Icon(
                                    Icons.star,
                                    size: 35,
                                  )
                                : const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 35,
                                  ),
                            controller.isStar == false
                                ? const Icon(
                                    Icons.star,
                                    size: 35,
                                  )
                                : const Icon(Icons.star,
                                    color: Colors.yellow, size: 35),
                            controller.isStar == false
                                ? const Icon(
                                    Icons.star,
                                    size: 35,
                                  )
                                : const Icon(Icons.star,
                                    color: Colors.yellow, size: 35),
                            SizedBox(
                              width: screenUtil.setWidth(20),
                            ),
                            const Text(
                              "4.5",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      );
                    }),
                    SizedBox(
                      height: screenUtil.setHeight(15),
                    ),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "About this service",
                          style: TextStyle(fontSize: 18),
                        )),
                    GetBuilder<MyController>(builder: (_) {
                      return Column(
                        children: [
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident , Excepteur sint occaecat cupidatat non proident.",
                            style: const TextStyle(fontSize: 16),
                            maxLines: controller.isShowMore ? 4 : null,
                            overflow: TextOverflow.ellipsis,
                          ),
                          TextButton(
                              onPressed: () {
                                controller.isShowMoree();
                              },
                              child: Text(
                                controller.isShowMore
                                    ? "Read less"
                                    : "Read more",
                                style: TextStyle(
                                    fontSize: 20, color: ColorApp.primary),
                              )),
                        ],
                      );
                    }),
                    SizedBox(
                      height: screenUtil.setHeight(20),
                    ),
                    Container(
                      height: screenUtil.setHeight(55),
                      width: screenUtil.setWidth(358),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Jobs done",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Container(
                            height: double.infinity,
                            width: screenUtil.setWidth(100),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: ColorApp.primary,
                            ),
                            child: const Center(
                              child: Text(
                                "151",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Reviews   (15)",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(color: ColorApp.primary),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(165),
                      child: CardDetailesView(
                          screenUtil: screenUtil, controller: controller),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: CustomButtomNavBar(screenUtil: screenUtil),
    );
  }
}




//

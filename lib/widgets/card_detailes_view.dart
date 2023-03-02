import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/myController.dart';

class CardDetailesView extends StatelessWidget {
  const CardDetailesView({
    super.key,
    required this.screenUtil,
    required this.controller,
  });

  final ScreenUtil screenUtil;
  final MyController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            width: screenUtil.setWidth(255),
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
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Container(
                        height: screenUtil.setHeight(80),
                        width: screenUtil.setWidth(60),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/jpeg/mohamed.jpeg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.start,
                        children: [
                          const Padding(
                              padding:
                                  EdgeInsets.only(top: 10)),
                          const Text("Customer  name"),
                          const SizedBox(
                            height: 5,
                          ),
                          GetBuilder<MyController>(
                              builder: (_) {
                            return Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                GetBuilder<MyController>(
                                    builder: (_) {
                                  return InkWell(
                                    onTap: () {
                                      controller.isStare();
                                    },
                                    child: Row(
                                      children: [
                                        controller.isStar ==
                                                false
                                            ? const Icon(
                                                Icons.star,
                                              )
                                            : const Icon(
                                                Icons.star,
                                                color: Colors
                                                    .yellow,
                                              ),
                                        controller.isStar ==
                                                false
                                            ? const Icon(
                                                Icons.star,
                                              )
                                            : const Icon(
                                                Icons.star,
                                                color: Colors
                                                    .yellow,
                                              ),
                                        controller.isStar ==
                                                false
                                            ? const Icon(
                                                Icons.star,
                                              )
                                            : const Icon(
                                                Icons.star,
                                                color: Colors
                                                    .yellow,
                                              ),
                                        controller.isStar ==
                                                false
                                            ? const Icon(
                                                Icons.star,
                                              )
                                            : const Icon(
                                                Icons.star,
                                                color: Colors
                                                    .yellow,
                                              ),
                                        SizedBox(
                                          width: screenUtil
                                              .setWidth(20),
                                        ),
                                        const Text(
                                          "4.5",
                                          style: TextStyle(
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ],
                            );
                          }),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: screenUtil.setWidth(170),
                            child: Column(
                              children: const [
                                Text(
                                  "Lorem ipsum dolor Lorem ipsum dolor , Lorem ipsum dolor Lorem ipsum dolor.",
                                  maxLines: 4,
                                  overflow:
                                      TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
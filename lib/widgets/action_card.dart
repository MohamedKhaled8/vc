import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vc/theme/constant/const_colors.dart';

class ActionCard extends StatefulWidget {
  const ActionCard({super.key});

  @override
  State<ActionCard> createState() => _ActionCardState();
}

class _ActionCardState extends State<ActionCard> {
  bool isStar = false;
  void isStare() {
    setState(() {
      isStar = !isStar;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: screenUtil.setHeight(125),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: screenUtil.setHeight(110),
                  width: screenUtil.setWidth(90),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorApp.primary.withOpacity(0.2)),
                  child: Image.asset("assets/icons/cleaning 1.png"),
                ),
                SizedBox(
                  width: screenUtil.setWidth(20),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "deep cleaning ",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text(
                      "15  / hr",
                      style: TextStyle(color: ColorApp.primary),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(20),
                    ),
                    InkWell(
                      onTap: () {
                        isStare();
                      },
                      child: Row(
                        children: [
                          isStar == false
                              ? const Icon(Icons.star)
                              : const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                          isStar == false
                              ? const Icon(Icons.star)
                              : const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                          isStar == false
                              ? const Icon(Icons.star)
                              : const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                          isStar == false
                              ? const Icon(Icons.star)
                              : const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                          SizedBox(
                            width: screenUtil.setWidth(30),
                          ),
                          const Text(
                            "4.5",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Icon(Icons.add)],
            ),
          ],
        ),
      ),
    );
  }
}

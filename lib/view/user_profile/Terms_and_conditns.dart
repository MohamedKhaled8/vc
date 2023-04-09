import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vc/theme/constant/sized.dart';
import 'package:vc/widgets/custom_containert_top_screen.dart';

class Termsandconditns extends StatelessWidget {
  const Termsandconditns({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height / 3 - 108,
                ),
                CustomContainerTopScreen(
                  ontap: () {
                    Get.back();
                  },
                  text: "Terms and conditns",
                  screenUtil: screenUtil,
                  size: 130,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.topLeft, child: Text("Sit quia ullam?")),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: screenUtil.setHeight(10),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                  "et consequatur nostrum aliquam suscipit commodi. Quia voluptatem sed harum fugiat veniam quam qui ab blanditiis. Praesentium et eos rem consequuntur et qui et et delectus. Quam voluptas ducimus est mollitia sed quas deserunt dolorem ut. Voluptatibus in assumenda rerum voluptas. Atque provident ut voluptatem incidunt illum."),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.topLeft, child: Text("Sit quia ullam?")),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: screenUtil.setHeight(10),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                  "et consequatur nostrum aliquam suscipit commodi. Quia voluptatem sed harum fugiat veniam quam qui ab blanditiis. Praesentium et eos rem consequuntur et qui et et delectus. Quam voluptas ducimus est mollitia sed quas deserunt dolorem ut. Voluptatibus in assumenda rerum voluptas. Atque provident ut voluptatem incidunt illum."),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.topLeft, child: Text("Sit quia ullam?")),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: screenUtil.setHeight(10),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                  "et consequatur nostrum aliquam suscipit commodi. Quia voluptatem sed harum fugiat veniam quam qui ab blanditiis. Praesentium et eos rem consequuntur et qui et et delectus. Quam voluptas ducimus est mollitia sed quas deserunt dolorem ut. Voluptatibus in assumenda rerum voluptas. Atque provident ut voluptatem incidunt illum."),
            ),
          ],
        ),
      ),
    );
  }
}

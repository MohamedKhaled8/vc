import 'package:flutter/material.dart';


import '../../theme/constant/const_colors.dart';
import '../../theme/constant/sized.dart';
import '../../widgets/container_shadow.dart';

class BuildItemCard extends StatelessWidget {
  final String image;
  final String text;
  final Function() onTap;
  const BuildItemCard({Key? key, required this.image, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap:onTap,
        child: Container(
          width: size.width,
          height: screenUtil.setHeight(50),
          decoration:
          buildShadowContainer(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(image),
                SizedBox(
                  width: screenUtil.setWidth(10),
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 16, color: ColorApp.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
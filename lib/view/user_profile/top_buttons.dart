import 'package:flutter/material.dart';
import 'package:vc/theme/constant/sized.dart';
import 'package:vc/theme/extensions/extensions.dart';

class TopButtons extends StatelessWidget {
  final String text;
  final String image;
  final Color cardColor;
  final VoidCallback onTapFunx;
  const TopButtons({
    super.key,
    required this.text,
    required this.image,
    required this.cardColor,
    required this.onTapFunx,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunx,
      child: Container(
        height: screenUtil.setHeight(65),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.5),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(
                width: screenUtil.setWidth(20),
              ),
              Transform.scale(
                scale: 0.8,
                child: Image.asset(image),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

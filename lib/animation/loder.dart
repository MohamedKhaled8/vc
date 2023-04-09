import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vc/theme/constant/sized.dart';

class Loder extends StatelessWidget {
  const Loder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenUtil.screenHeight,
      width: screenUtil.screenWidth,
      color: Colors.greenAccent.withOpacity(0.05),
      child: Transform.scale(
          scale: 0.5, child: Lottie.asset('assets/icons/bar-loader.json')),
    );
  }
}

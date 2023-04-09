import 'package:flutter/material.dart';
import 'package:vc/theme/constant/sized.dart';

class ExtraServiceBtn extends StatelessWidget {
  final String text;
  const ExtraServiceBtn({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.symmetric(horizontal:20,vertical: 5 ),
      height: screenUtil.setHeight(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          text,
        ),
      ),
    );
    }
}
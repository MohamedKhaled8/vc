// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ArrowBackIcon extends StatelessWidget {
  const ArrowBackIcon({
    Key? key,
    this.ontap,
    this.color,
  }) : super(key: key);
  final Function()? ontap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Icon(
          Icons.arrow_back_ios,
          color: color,
        ));
  }
}

import 'package:flutter/material.dart';

buildShadowContainer({required BorderRadius borderRadius}) {
  return BoxDecoration(
      borderRadius: borderRadius,
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
            color: Color(0x33000000),
            offset: Offset(0, 0),
            blurRadius: 8,
            spreadRadius: 0)
      ]);
}

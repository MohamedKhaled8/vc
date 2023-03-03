import 'package:flutter/material.dart';

  buildShadowContainer({required BorderRadius borderRadius}){
  return  BoxDecoration(
      borderRadius: borderRadius,
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          offset: const Offset(0, 3),
          spreadRadius: 3,
          blurRadius: 5,
        )
      ]);
}


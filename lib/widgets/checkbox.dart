// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import '../controller/authentication_controller/auth_controller.dart';

class chcekBox extends StatelessWidget {
  const chcekBox({
    super.key,
    required this.controller,
  });

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: controller.isCheckBox,
        onChanged: ((value) {
          controller.isCheckBox = value!;
        }));
  }
}

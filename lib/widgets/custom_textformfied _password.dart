// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class CustomTextFormFieldPassword extends StatelessWidget {
  CustomTextFormFieldPassword({
    Key? key,
    required this.text,
  }) : super(key: key);
  final controller = Get.put(AuthController());
  final String text;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'املاء المطوب';
          }
          return null;
        },
        autofocus: false,
        textInputAction: TextInputAction.next,
        onSaved: (newValue) {
          controller.emailCont.text = newValue!;
        },
        keyboardType: TextInputType.visiblePassword,
        obscureText: controller.isPasswordHidden.value,
        controller: controller.passCont,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: () {
              controller.isPasswordHidden.value =
                  !controller.isPasswordHidden.value;
            },
            child: Icon(controller.isPasswordHidden.value
                ? Icons.visibility_off
                : Icons.visibility),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.green),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: Colors.green),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: Colors.red),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
          hintText: text,
          hintStyle: const TextStyle(fontSize: 14 , fontWeight: FontWeight.bold),
          fillColor: Colors.white,
          filled: true,
        ),
      );
    });
  }
}

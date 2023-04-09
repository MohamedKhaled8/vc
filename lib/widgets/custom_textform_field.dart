import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/controller/animation_controller.dart';
import 'package:vc/helper/caching_data.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/view/map_view/map_screen.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final String text;
  final TextInputType type;
  FormFieldValidator? validate;
  TextEditingController? controller;
  final int? maxLen;
  final bool? visaData;
  final bool? enable;
  final bool suffixIcon;
  Icon? icon;
  // ignore: non_constant_identifier_name
  String _mmYY = '';
  final int? textFiledIndex;
  CustomTextFormField({
    Key? key,
    required this.text,
    this.icon,
    required this.type,
    this.controller,
    this.validate,
    this.maxLen,
    this.visaData,
    this.enable = true,
    this.suffixIcon = false,
    this.textFiledIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Animation_Controller _controller = Animation_Controller();
    return TextFormField(
      enabled: enable,
      // textDirection: TextDirection.ltr,
      maxLength: maxLen,
      validator: validate,
      autofocus: false,
      controller: controller,
      textInputAction: TextInputAction.next,
      onSaved: (newValue) {},
      keyboardType: type,
      onChanged: (value) {
        if (visaData != null && visaData!) {
          if (value.length == 4 && value.length > _mmYY.length) {
            controller!.text = '/${value}';
            _mmYY = controller!.text;
          } else {
            _mmYY = controller!.text;
          }
        }
      },

      decoration: InputDecoration(
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
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: ColorApp.primary),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        hintText: text,
        hintStyle: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: suffixIcon
            ? InkWell(
                onTap: () async {
                  _controller.loder();
                  await CachingData.getLocation();
                  _controller.loder();

                  Get.to(
                    () => MapScreen(
                      addressIndex: textFiledIndex ?? 0,
                    ),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 1000),
                  );
                },
                child: Image.asset(
                  "assets/icons/maps.png",
                ),
              )
            : null,
      ),
    );
  }
}

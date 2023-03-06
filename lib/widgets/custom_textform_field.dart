// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.text,

    this.icon, required this.type,  this.controller,  this.validate,
  }) : super(key: key);
  final String text;
  final TextInputType type;
   FormFieldValidator? validate;
   TextEditingController? controller;
  Icon? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      autofocus: false,
      controller: controller,
      textInputAction: TextInputAction.next,
      onSaved: (newValue) {},
      keyboardType: type,
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
        hintText: text,
        hintStyle: const TextStyle(fontSize: 14 , fontWeight: FontWeight.bold,color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: icon,
      ),
    );
  }
}

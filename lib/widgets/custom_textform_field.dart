// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.text,
    this.icon,
  }) : super(key: key);
  final String text;

  Icon? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'املاء المطوب';
        }
        return null;
      },
      autofocus: false,
      textInputAction: TextInputAction.next,
      onSaved: (newValue) {},
      keyboardType: TextInputType.emailAddress,
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
        contentPadding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
        hintText: text,
        hintStyle: const TextStyle(fontSize: 14 , fontWeight: FontWeight.bold),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}

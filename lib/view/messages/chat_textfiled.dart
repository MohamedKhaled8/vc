import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vc/controller/bottom_bar_controller.dart';

class Chat_TextFiled extends StatelessWidget {
  final String hintText;
  final Color borderColor;
  final EdgeInsets Padding;
  final double borderRaduis;
  final double borderWidth;
  final double textFiledHight;
  final bool passwordText;
  Image? suffixIcon;
  final VoidCallback? iconOnTap;
  final TextEditingController textController;
  final Function(String value) onChange;
  Chat_TextFiled({
    super.key,
    required this.hintText,
    required this.borderColor,
    this.Padding = const EdgeInsets.all(0),
    required this.borderRaduis,
    required this.borderWidth,
    this.textFiledHight = 1,
    this.passwordText = false,
    this.iconOnTap,
    this.suffixIcon,
    required this.textController,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    ChatBottomBarController _controller = Get.put(ChatBottomBarController());
    TextEditingController _textEditingController = TextEditingController();

    return Container(
      padding: Padding,
      child: GetBuilder<ChatBottomBarController>(builder: (controller) {
        return TextField(
          onChanged: onChange,
          textDirection: TextDirection.ltr,
          controller: textController,
          maxLines: 1,
          style: TextStyle(height: textFiledHight),
          obscureText: passwordText,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffFBFBFB),
            hintText: hintText,
            hintStyle: TextStyle(
              height: 1,
              color: const Color.fromARGB(255, 160, 158, 158),
              fontSize: 15,
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontWeight: FontWeight.w500,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                _controller.emojisShow_Off();
              },
              icon: suffixIcon != null ? suffixIcon! : const SizedBox(),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: const Color.fromARGB(255, 255, 0, 0),
                    width: borderWidth),
                borderRadius: BorderRadius.circular(borderRaduis)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: const Color.fromARGB(255, 255, 0, 0),
                    width: borderWidth),
                borderRadius: BorderRadius.circular(borderRaduis)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: borderWidth),
                borderRadius: BorderRadius.circular(borderRaduis)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: borderWidth),
                borderRadius: BorderRadius.circular(borderRaduis)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(borderRaduis)),
            focusColor: borderColor,
          ),
        );
      }),
    );
  }
}

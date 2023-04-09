import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:vc/theme/constant/const_colors.dart';

class TextChatBubble extends StatelessWidget {
  final String message;
  final bool sender;
  const TextChatBubble(
      {super.key, required this.message, required this.sender});

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: message,
      color: sender ? ColorApp.primary.withOpacity(0.9) : ColorApp.buttonBlue,
      tail: true,
      isSender: sender,
      textStyle: const TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}

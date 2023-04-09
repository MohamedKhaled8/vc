import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
import 'package:flutter/material.dart';

import 'package:vc/theme/constant/const_colors.dart';

class ImageChatBubble extends StatelessWidget {
  final String image;
  final bool sender;
  final String id;
  const ImageChatBubble(
      {super.key, required this.image, required this.sender, required this.id});

  @override
  Widget build(BuildContext context) {
    return BubbleNormalImage(
      id: id,
      image: Image.network(image),
      color: sender ? ColorApp.primary.withOpacity(0.9) : ColorApp.buttonBlue,
      tail: true,
      isSender: sender,
    );
  }
}

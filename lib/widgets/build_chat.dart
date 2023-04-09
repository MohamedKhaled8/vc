import 'package:flutter/material.dart';
import 'package:vc/theme/constant/sized.dart';

Container buildChatComposer() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    color: Colors.white,
    height: screenUtil.setHeight(100),
    child: Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            height: screenUtil.setHeight(60),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.grey[500],
                ),
                SizedBox(
                  width: screenUtil.setWidth(10),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type your message ...',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                ),
                Icon(
                  Icons.attach_file,
                  color: Colors.grey[500],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: screenUtil.setWidth(16),
        ),
        const CircleAvatar(
          backgroundColor: Color(0xffFCAAAB),
          child: Icon(
            Icons.mic,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}

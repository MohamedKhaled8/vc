import 'package:flutter/material.dart';
import 'package:vc/theme/constant/sized.dart';

import '../model/chat_room_mode.dart';
import '../model/user_model.dart';

class Conversation extends StatelessWidget {
  const Conversation({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        reverse: true,
        itemCount: messages.length,
        itemBuilder: (context, int index) {
          final message = messages[index];
          bool isMe = message.sender?.id == currentUser.id;
          return Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (!isMe)
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(user.avatar),
                      ),
                    SizedBox(
                      width: screenUtil.setWidth(10),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6),
                      decoration: BoxDecoration(
                          color:
                              isMe ? const Color(0xffFCAAAB) : Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(isMe ? 12 : 0),
                            bottomRight: Radius.circular(isMe ? 0 : 12),
                          )),
                      child: Text(
                        messages[index].text!,
                        style: TextStyle(
                            color: isMe ? Colors.white : Colors.grey[800]),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment:
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      if (!isMe)
                        SizedBox(
                          width: screenUtil.setWidth(40),
                        ),
                      const Icon(
                        Icons.done_all,
                        size: 20,
                        color: Color(0xffAEABC9),
                      ),
                      SizedBox(
                        width: screenUtil.setWidth(8),
                      ),
                      Text(
                        message.time!,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}

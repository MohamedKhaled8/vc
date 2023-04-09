import 'package:flutter/material.dart';
import 'package:vc/controller/chat/chat_controller.dart';
import 'package:vc/helper/caching_data.dart';
import 'package:vc/model/chat/get_room_message_model.dart';
import 'package:vc/view/messages/bottombar_.dart';
import 'package:vc/view/messages/chat_appbar.dart';
import 'package:vc/view/messages/image_chat_bubble.dart';
import 'package:vc/view/messages/text_chat_bubble.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});

  static const String id = '/ChatScreenScreenId';
  static final ScrollController _scrollController = ScrollController();
  final ChatController chatController = ChatController();
  bool sender = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ChatAppBar(),
          StreamBuilder(
            stream: chatController.getRoomMessage(id: '11', context: context).asStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                final GetRoomMessageModel roomMessage =
                    snapshot.data as GetRoomMessageModel;
                for (var element in roomMessage.data!) {
                  if (element.senderId == loginData.userData.id) {
                    sender = true;
                  } else {
                    sender = false;
                  }
                  if (element.media.isEmpty) {
                    messageList.add(
                      TextChatBubble(message: element.message, sender: sender),
                    );
                  } else {
                    messageList.add(
                      ImageChatBubble(
                          image: element.media.first,
                          sender: sender,
                          id: element.id.toString()),
                    );
                  }
                }
                return Expanded(
                  child: ListView.builder(
                      controller: _scrollController,
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                        return messageList[index];
                      }),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20, top: 8),
            child: ChatBottomBar(),
          ),
        ],
      ),
    );
  }
}

List messageList = [];
String image =
    'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg';

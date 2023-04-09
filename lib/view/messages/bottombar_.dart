import 'dart:io';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';
import 'package:vc/controller/bottom_bar_controller.dart';
import 'package:vc/controller/chat/chat_controller.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/view/messages/chat_textfiled.dart';
import 'package:vc/view/messages/views/chat_view.dart';
import 'package:vc/view/messages/widgets/audio_chat_bubble.dart';
import 'package:whatsapp_camera/camera/camera_whatsapp.dart';

class ChatBottomBar extends StatefulWidget {
  const ChatBottomBar({super.key});

  @override
  State<ChatBottomBar> createState() => _ChatBottomBarState();
}

class _ChatBottomBarState extends State<ChatBottomBar> {
  final TextEditingController _textController = TextEditingController();
  final ChatController chatController = ChatController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          GetBuilder<ChatBottomBarController>(
            init: ChatBottomBarController(),
            builder: (_) => Row(
              children: [
                _.msgLen
                    ? InkWell(
                        onTap: ()async {
                         await chatController.sendMessage(message: _textController.text, roomId: '11', context: context);
                        },
                        child: Container(
                          height: 40,
                          width: 55,
                          margin:
                              const EdgeInsets.only(top: 9, left: 8, right: 12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset('assets/icons/send.png'),
                        ),
                      )
                    : Container(
                        clipBehavior: Clip.none,
                        margin:
                            const EdgeInsets.only(top: 15, left: 8, right: 20),
                        // alignment: Alignment.centerRight,
                        child: SocialMediaRecorder(
                          recordIconBackGroundColor: ColorApp.primary,
                          sendRequestFunction: (soundFile) async {
                            final player = AudioPlayer();
                            final _Duration =
                                await player.setUrl(soundFile.path);

                            messageList.add(
                              AudioChatBuble(
                                audio: soundFile.path,
                                duration: _Duration!,
                                sender: true,
                              ),
                            );
                            setState(() {});
                          },
                          encode: AudioEncoderType.AAC,
                        ),
                      ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: SizedBox(
                    width: 275,
                    child: Chat_TextFiled(
                      onChange: (value) {
                        _.checkMsgLen(textLen: value.length);
                      },
                      textController: _textController,
                      hintText: 'message ................',
                      Padding: const EdgeInsets.only(top: 8),
                      borderColor: ColorApp.primary,
                      borderRaduis: 20,
                      borderWidth: 2,
                      textFiledHight: 1,
                      suffixIcon: Image.asset('assets/icons/emoji.png'),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    List<File>? files = await Get.to(const WhatsappCamera());
                  },
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(top: 9.5, right: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 2,
                          color: ColorApp.primary,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/icons/pic.png')),
                ),
              ],
            ),
          ),
          GetBuilder<ChatBottomBarController>(
            init: ChatBottomBarController(),
            builder: (controller) {
              if (controller.showEmogis) {
                return SizedBox(
                    height: 250,
                    child: EmojiPicker(
                      onEmojiSelected: (category, emoji) {
                        _textController.text =
                            _textController.text + emoji.emoji;
                      },
                      config: const Config(bgColor: Color(0xffE3E3E3)),
                    ));
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/animation/dismissible.dart';
import 'package:vc/controller/chat/chat_controller.dart';
import 'package:vc/controller/myController.dart';
import 'package:vc/model/chat/check_room_model.dart';
import 'package:vc/model/chat/latest_message_model.dart';
import 'package:vc/view/messages/views/chat_view.dart';
import 'package:vc/widgets/container_shadow.dart';
import '../../../theme/constant/const_colors.dart';

class MessageDesign extends StatelessWidget {
  final ScreenUtil screenUtil;
  final CheckRoomModel roomModel;
  final MyController controller;
  final ChatController chatController = Get.put(ChatController());
  MessageDesign({
    super.key,
    required this.screenUtil,
    required this.controller,
    required this.roomModel,
  });
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: chatController.latestMessage(
            // roomId: roomModel.data!.latest!.roomId.toString(),
            roomId: '12',
            context: context),
        builder: ((context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            final LatestMessageModel latestModel =
                snapshot.data as LatestMessageModel;
            return InkWell(
              onTap: () {
                Get.to(
                  () => ChatView(),
                  transition: Transition.zoom,
                  duration: const Duration(milliseconds: 1000),
                );
              },
              child: CustomDismissble(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: screenUtil.setHeight(105),
                    decoration: buildShadowContainer(
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenUtil.setWidth(5),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          height: screenUtil.setHeight(90),
                          width: screenUtil.setWidth(80),
                          decoration: BoxDecoration(
                            color: ColorApp.card,
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage("assets/icons/cleaning 1.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenUtil.setWidth(10),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text('Deep Cleaning ',
                                        style: TextStyle(
                                            color: ColorApp.primary,
                                            fontSize: 14)),
                                  ),
                                  Text(latestModel.data.latest.seenAt,
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 14)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(latestModel.data.latest.message,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12)),
                                    ],
                                  ),
                                  Container(
                                    height: screenUtil.setHeight(20),
                                    width: screenUtil.setWidth(20),
                                    decoration: BoxDecoration(
                                        color: ColorApp.primary,
                                        shape: BoxShape.circle),
                                    child: Center(
                                      child: Text(
                                        latestModel.data.unread.toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        }));
  }
}

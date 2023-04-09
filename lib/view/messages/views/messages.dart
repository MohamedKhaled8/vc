import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/controller/chat/chat_controller.dart';
import 'package:vc/view/messages/widgets/message_widget.dart';
import 'package:vc/widgets/custom_containert_top_screen.dart';
import '../../../controller/myController.dart';
import '../../../helper/caching_data.dart';
import '../../../model/chat/check_room_model.dart';

class MassageScreen extends StatelessWidget {
  MassageScreen({Key? key,}) : super(key: key);
  final ScreenUtil screenUtil = ScreenUtil();
  final controller = Get.put(MyController());
  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CustomContainerTopScreen(
                    size: 120,
                    text: "Chat",
                    screenUtil: screenUtil,
                    ontap: () {
                      Get.back();
                    },
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  "Messages",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: screenUtil.setHeight(15),
              ),

              FutureBuilder(
                  future: chatController.checkRoomMessage(
                      // userId:loginData.userData.id.toString(),
                    userId: '3',
                      context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.done) {
                      final CheckRoomModel roomModel = snapshot
                          .data as CheckRoomModel;
                      return MessageDesign(
                          screenUtil: screenUtil,
                          controller: controller,
                          roomModel: roomModel);
                    }
                    else {
                      return const SizedBox();
                    }
                  }),
            ],
          )),
    );
  }
}

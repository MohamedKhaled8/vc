import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/view/messages/widgets/message_widget.dart';
import 'package:vc/widgets/custom_appbar_two.dart';
import '../../../controller/myController.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({Key? key}) : super(key: key);
final ScreenUtil screenUtil = ScreenUtil();
   final controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:DefaultAppBar(110, text: 'Chat', onTap: (){}),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.ph,
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10),
             child: const Text('Messages',style: TextStyle(fontSize: 18),),
           ),
            10.ph,
            Expanded(child: ListView.separated(
              separatorBuilder: (context,index)=>const SizedBox(height: 8,),
                itemCount: 10,
                itemBuilder: (context,index)=>MessageDesign(screenUtil: screenUtil, controller: controller)),),
          ],
        ),
      ),
    );
  }
}

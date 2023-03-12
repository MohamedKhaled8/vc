// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/widgets/container_shadow.dart';

import '../../../../widgets/arrow_back_icons.dart';
import '../../../controller/myController.dart';
import '../../../widgets/cutom_buttom_two.dart';

class ChatView extends StatelessWidget {
   ChatView({super.key});
   final ScreenUtil screenUtil = ScreenUtil();

   final controller = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: screenUtil.setHeight(125),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children:   [
                        const ArrowBackIcon(),
                        Container(
                          height: screenUtil.setHeight(85),
                          width: screenUtil.setWidth(85),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorApp.primary.withOpacity(0.3)),
                          child: Image.asset("assets/icons/cleaning 1.png"),
                        ),
                        SizedBox(width: screenUtil.setHeight(15),),
                        Text("Deep Cleaning " , style: TextStyle(fontSize: 16),),
                        SizedBox(width: screenUtil.setHeight(90),),
                        InkWell(
                            onTap: () {

                            },
                            child: Image.asset("assets/icons/video.png")),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: screenUtil.setWidth(120),
                          height: screenUtil.setHeight(40),
                          decoration: BoxDecoration(color: ColorApp.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(child: Text('January 24, 2015',style: TextStyle(color: Colors.white,fontSize: 10),),),
                        ),
                      ),
                      15.ph,
                      buildMessage(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit a',
                        true,
                      ),
                      Text('9:39 pm',style: TextStyle(fontSize: 10),),
                      30.ph,
                      buildMessage(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit a',
                        false,
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: Text('9:39 pm',style: TextStyle(fontSize: 10),)),
                      30.ph,
                      buildMessage(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit a',
                        true,
                      ),
                      30.ph,
                      buildMessage(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit a',
                        false,
                      ),
                      30.ph,
                      buildMessage(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit a',
                        true,
                      ),
                      30.ph,
                      buildMessage(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit a',
                        false,
                      ),
                      30.ph,
                      buildMessage(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit a',
                        true,
                      ),
                      30.ph,

                      buildMessage(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit amet, consectetur adipiscing elit. VeLorem ipsum dolor sit a',
                        false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        bottomNavigationBar: Container(
          height: screenUtil.setHeight(90),
          decoration:
          buildShadowContainer(borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child:  Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: screenUtil.setHeight(60),
                  width: size.width-100,
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    decoration:  InputDecoration(
                      suffixIcon:   Container(
                        width: screenUtil.setWidth(40),
                        height: screenUtil.setHeight(40),
                        decoration: BoxDecoration(
                          color: Color(0xffE7E7E7),
                            image: DecorationImage(
                                image: AssetImage('assets/icons/gallery.png')
                            ),
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 10),
                      hintText: 'Type a message.....',
                      hintStyle: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      fillColor: Color(0xffE7E7E7),
                      filled: true,
                    ),
                  ),
                ),
              ),
              Container(
                width: screenUtil.setWidth(40),
                height: screenUtil.setHeight(40),
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage('assets/icons/send.png')
                 )
               ),
              )
            ],
          ),
        ),

      ),
    );
  }
   Widget buildMessage(String text, bool isMe) {
     return Container(
       margin: EdgeInsets.only(bottom: 10.0),
       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
       decoration: BoxDecoration(
         color: isMe ?  Colors.grey[300]:Color(0xffCBF4C1),
         borderRadius: BorderRadius.only(
           topLeft: Radius.circular(20.0),
           topRight: Radius.circular(20.0),
           bottomLeft: isMe ?  Radius.zero:Radius.circular(20.0) ,
           bottomRight: isMe ? Radius.circular(20.0):Radius.zero,
         ),
       ),
       child: Text(text),
     );
   }
}

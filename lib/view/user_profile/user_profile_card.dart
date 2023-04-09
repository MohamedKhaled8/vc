import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/controller/authentication_controller/logout_controller.dart';
import 'package:vc/model/auth/profile_model.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/theme/constant/sized.dart';
import 'package:vc/view/auth_view/auth_view.dart';
import 'package:vc/view/messages/views/chat_view.dart';
import 'package:vc/view/user_profile/Terms_and_conditns.dart';
import 'package:vc/view/user_profile/faq_screen.dart';
import 'package:vc/view/user_profile/item_card.dart';
import 'package:vc/view/user_profile/profile_setting_screen.dart';
import 'package:vc/widgets/container_shadow.dart';
import 'package:url_launcher/url_launcher.dart';
class UserProfileCard extends StatefulWidget {
  UserProfileCard({
    super.key,
    required this.size,
    required this.screenUtil,
  });

  final Size size;
  final ScreenUtil screenUtil;
ProfileModel? data;
  @override
  State<UserProfileCard> createState() => _UserProfileCardState();
}

class _UserProfileCardState extends State<UserProfileCard> {
  final LogoutController logoutController = LogoutController();

  List<Map<String, dynamic>> _items = List.generate(
      1,
          (index) => {
        'id': index,
        'title': 'Item $index',
        'description':
        'This is the description of the item $index. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        'isExpanded': false
      });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Get.to(
                      () => ProfileSettingScreen(data:widget.data! ,),
                  transition: Transition.leftToRight,
                  duration: const Duration(milliseconds: 1000),
                );
              },
              child: Container(
                width: widget.size.width,
                height: widget.screenUtil.setHeight(50),
                decoration:
                buildShadowContainer(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset("assets/icons/user.png"),
                      SizedBox(
                        width: widget.screenUtil.setWidth(10),
                      ),
                      Text(
                        'Profile Settings',
                        style: TextStyle(fontSize: 16, color: ColorApp.grey),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.navigate_next_sharp,
                        color: Colors.grey,
                        size: 30,
                      ),
                      SizedBox(
                        width: widget.screenUtil.setWidth(10),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: widget.screenUtil.setHeight(20),
          ),
          BuildItemCard(
              image: 'assets/icons/document.png',
              text: 'Terms and conditions',
              onTap: () {
                Get.to(
                  const Termsandconditns(),
                  transition: Transition.fadeIn,
                  duration: const Duration(milliseconds: 700),
                );
              }),
          SizedBox(
            height: widget.screenUtil.setHeight(20),
          ),
          BuildItemCard(
              image: 'assets/icons/faqs.png',
              text: 'FAQ’s',
              onTap: () {
                Get.to(
                  const FaqScreen(),
                  transition: Transition.fadeIn,
                  duration: const Duration(milliseconds: 700),
                );
              }),
          SizedBox(
            height: widget.screenUtil.setHeight(20),
          ),
          BuildItemCard(
            image: 'assets/icons/sign-out.png',
            text: 'Log out',
            onTap: () async {
              final data = await logoutController.logout(context: context);
              if (data) {
                Get.offAll(
                      () => const AuthAppView(),
                  transition: Transition.topLevel,
                  duration: const Duration(milliseconds: 2000),
                );
              }
            },
          ),
          SizedBox(
            height: widget.screenUtil.setHeight(20),
          ),
          ExpansionPanelList(
            elevation: 3,
            expansionCallback: (index, isExpanded) {
              setState(() {
                _items[index]['isExpanded'] = !isExpanded;
              });
            },
            animationDuration: Duration(milliseconds: 600),
            children: _items
                .map(
                  (item) => ExpansionPanel(
                canTapOnHeader: true,
                backgroundColor:
                item['isExpanded'] == true ? Colors.white : Colors.white,
                headerBuilder: (_, isExpanded) =>
                    Container(
                      padding:  const EdgeInsets.symmetric(horizontal: 20),
                      width: screenUtil.scaleWidth,
                      height: screenUtil.setHeight(50),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset('assets/icons/contactus.png'),
                            SizedBox(
                              width: screenUtil.setWidth(10),
                            ),
                            Text(
                              'Contact Us',
                              style: TextStyle(fontSize: 16, color: ColorApp.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                body:  Column(
                  children: [
                    SizedBox(height: screenUtil.setHeight(15),),
                    BuildItemCard(
                        image: 'assets/icons/chat.png',
                        text: 'chat with us',
                        onTap: () {
                          Get.to(
                            ChatView(),
                            transition: Transition.fadeIn,
                            duration: const Duration(milliseconds: 700),
                          );
                        }),
                    SizedBox(height: screenUtil.setHeight(15),),
                    BuildItemCard(
                        image: 'assets/icons/phonecall.png',
                        text: 'Phone call',
                        onTap: () {
                          makePhoneCall(phoneNumber: '01092503248');
                        }),
                    SizedBox(height: screenUtil.setHeight(15),),

                    BuildItemCard(
                        image: 'assets/icons/website.png',
                        text: 'Website',
                        onTap: () {
                          sendMail(uri: 'https://pub.dev');
                        }),
                    SizedBox(height: screenUtil.setHeight(15),),

                    BuildItemCard(
                        image: 'assets/icons/emailicon.png',
                        text: 'E-mail address',
                        onTap: () {
                          sendMail(uri: 'mailto:eyads3514@gmail.com');
                        }),
                  ],
                ),
                isExpanded: item['isExpanded'],

              ),
            )
                .toList(),
          ),

        ]
    );
  }
  sendMail({required String uri}) async {
    // const uri =
    //     'mailto:test@example.org?subject=Greetings&body=Hello%20World';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
  Future<void> makePhoneCall({required String phoneNumber}) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
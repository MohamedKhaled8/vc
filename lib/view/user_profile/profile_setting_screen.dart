import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/animation/loder.dart';
import 'package:vc/controller/animation_controller.dart';
import 'package:vc/controller/authentication_controller/update_profile_controller.dart';
import 'package:vc/model/auth/profile_model.dart';
import 'package:vc/view/user_profile/profile_setting_button.dart';
import 'package:vc/widgets/container_shadow.dart';
import 'package:whatsapp_camera/camera/camera_whatsapp.dart';
import '../../../theme/constant/const_colors.dart';
import '../../../widgets/custom_textform_field.dart';
import '../../widgets/custom_containert_top_screen.dart';
import '../../widgets/custom_textformfied _password.dart';

class ProfileSettingScreen extends StatefulWidget {
  final ProfileModel data;
  const ProfileSettingScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  final ScreenUtil screenUtil = ScreenUtil();
  final TextEditingController number = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController addressCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  final TextEditingController newPassCont = TextEditingController();
  final TextEditingController comfirmPassCont = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final updateProfileController = Get.put(UpdateProfileController());
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    addAddressToList(AddressList: widget.data.userData);
  }

  @override
  Widget build(BuildContext context) {
    setValues();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: size.width,
                        height: size.height / 2 - 85,
                      ),
                      CustomContainerTopScreen(
                        ontap: () {
                          Get.back();
                        },
                        text: "User Profile",
                        screenUtil: screenUtil,
                        size: 200,
                      ),
                      Positioned(
                        left: 50,
                        right: 50,
                        top: 115,
                        child: Container(
                          height: screenUtil.setHeight(176),
                          width: screenUtil.setWidth(176),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 3,
                                blurRadius: 3,
                                color: Colors.grey.withOpacity(0.5),
                                offset: const Offset(0, 3),
                              ),
                            ],
                            image: DecorationImage(
                              image: setImage(),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 47.5,
                        left: 187,
                        child: InkWell(
                          onTap: () async {
                            List<File>? res = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WhatsappCamera(),
                              ),
                            );
                          },
                          child: Container(
                            height: screenUtil.setHeight(25),
                            width: screenUtil.setWidth(35),
                            decoration: buildShadowContainer(
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Icon(Icons.person),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Account',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(10),
                          ),
                          Container(
                            height: screenUtil.setHeight(250),
                            decoration: buildShadowContainer(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CustomTextFormField(
                                      text: 'Enter Your Name',
                                      controller: name,
                                      icon: const Icon(
                                          Icons.edit_calendar_outlined),
                                      type: TextInputType.name,
                                      validate: (value) {
                                        if (value.isEmpty) {
                                          return 'Required';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: screenUtil.setHeight(10),
                                    ),
                                    CustomTextFormField(
                                      text: 'national identification number',
                                      controller: number,
                                      icon: const Icon(
                                          Icons.edit_calendar_outlined),
                                      type: TextInputType.number,
                                      validate: (value) {
                                        if (value.isEmpty) {
                                          return 'Required';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: screenUtil.setHeight(10),
                                    ),
                                    CustomTextFormField(
                                      text: 'Enter Your Email',
                                      controller: email,
                                      icon: const Icon(
                                          Icons.edit_calendar_outlined),
                                      type: TextInputType.emailAddress,
                                      validate: (value) {
                                        if (value.isEmpty) {
                                          return 'Required';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: screenUtil.setHeight(10),
                                    ),
                                    CustomTextFormField(
                                      text: 'Enter Your Number',
                                      controller: phone,
                                      icon: const Icon(
                                          Icons.edit_calendar_outlined),
                                      type: TextInputType.number,
                                      validate: (value) {
                                        if (value.isEmpty) {
                                          return 'Required';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(15),
                          ),
                          const Text(
                            'Address',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(10),
                          ),
                          Container(
                            height: screenUtil.setHeight(150),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 3,
                                  spreadRadius: 3,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ListView.builder(
                              controller: _scrollController,
                              itemCount: addressTextFiled.length,
                              itemBuilder: ((context, index) {
                                return Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: addressTextFiled[index],
                                  ),
                                );
                              }),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                textController.add(TextEditingController());
                                addressTextFiled.add(
                                  CustomTextFormField(
                                    textFiledIndex: addressTextFiled.length,
                                    suffixIcon: true,
                                    text: 'Address',
                                    controller: textController.last,
                                    icon: const Icon(
                                      Icons.edit_calendar_outlined,
                                      color: Colors.grey,
                                    ),
                                    type: TextInputType.name,
                                  ),
                                );
                              });
                              _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeIn);
                            },
                            child: Container(
                              height: screenUtil.setHeight(80),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: screenUtil.setHeight(10),
                                    ),
                                    Center(
                                      child: Container(
                                        width: size.width / 2,
                                        height: screenUtil.setHeight(40),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: ColorApp.primary),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Row(
                                            children: [
                                              Container(
                                                height:
                                                    screenUtil.setHeight(30),
                                                width: screenUtil.setWidth(30),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: ColorApp.primary),
                                                ),
                                                child: Center(
                                                    child: Icon(
                                                  Icons.add,
                                                  color: ColorApp.primary,
                                                )),
                                              ),
                                              SizedBox(
                                                width: screenUtil.setWidth(30),
                                              ),
                                              Expanded(
                                                  child: Text(
                                                ' Add Address',
                                                style: TextStyle(
                                                    color: ColorApp.primary,
                                                    fontSize: 14),
                                              )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(10),
                          ),
                          Container(
                            height: screenUtil.setHeight(250),
                            decoration: buildShadowContainer(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  CustomTextFormFieldPassword(
                                    text: 'Old password',
                                    controllerTwo: passCont,
                                  ),
                                  SizedBox(
                                    height: screenUtil.setHeight(10),
                                  ),
                                  CustomTextFormFieldPassword(
                                    text: 'New password',
                                    controllerTwo: newPassCont,
                                  ),
                                  SizedBox(
                                    height: screenUtil.setHeight(10),
                                  ),
                                  CustomTextFormFieldPassword(
                                    text: 'Confirm password',
                                    controllerTwo: comfirmPassCont,
                                  ),
                                  SizedBox(
                                    height: screenUtil.setHeight(20),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: screenUtil.setHeight(40),
                                      width: screenUtil.setWidth(210),
                                      decoration: BoxDecoration(
                                        color: ColorApp.primary,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          " Change Password",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GetBuilder<Animation_Controller>(
                init: Animation_Controller(),
                builder: (controller) {
                  if (controller.loderShow) {
                    return const Loder();
                  } else {
                    return const SizedBox();
                  }
                }),
          ],
        ),
        bottomNavigationBar: ProfileSettingButton(
            onTap: () async {
              final data = await updateProfileController.updateProfile(
                  name: name.text,
                  email: email.text,
                  address: addressCont.text,
                  phone: phone.text,
                  context: context);
            },
            btnText: 'Save Changes',
            screenUtil: screenUtil,
            size: size),
      ),
    );
  }

  setValues() {
    name.text = widget.data.userData.name;
    email.text = widget.data.userData.email;
    number.text = widget.data.userData.phone.toString();
    email.text = widget.data.userData.email;
  }

  ImageProvider<Object> setImage() {
    if (widget.data.userData.photo != null &&
        widget.data.userData.photo.contains('http')) {
      return NetworkImage(widget.data.userData.photo);
    } else {
      return const AssetImage('assets/images/png/user.png');
    }
  }

  addAddressToList({required UserData AddressList}) {
    textController.clear();
    addressTextFiled.clear();
    for (int index = 0; index < AddressList.address.length; index++) {
      textController.add(TextEditingController());
      addressTextFiled.add(CustomTextFormField(
        textFiledIndex: index,
        suffixIcon: true,
        text: 'Address',
        controller: textController.last,
        icon: const Icon(
          Icons.edit_calendar_outlined,
          color: Colors.grey,
        ),
        type: TextInputType.name,
      ));

      textController.last.text =
          AddressList.address[index].toString().isNotEmpty
              ? AddressList.address[index]
              : 'Address';
    }
  }
}

List<CustomTextFormField> addressTextFiled = [];

List<TextEditingController> textController = [];

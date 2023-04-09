import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/animation/loder.dart';
import 'package:vc/controller/animation_controller.dart';
import 'package:vc/controller/authentication_controller/rest_password_controller.dart';
import 'package:vc/view/auth_view/login_view.dart';
import 'package:vc/widgets/custom_buttom.dart';
import '../../theme/constant/const_colors.dart';
import '../../widgets/arrow_back_icons.dart';
import '../../widgets/custom_textformfied _password.dart';
import 'forgot_password.dart';

class RestPasswordScreen extends StatelessWidget {
  final String? passingEmail;
  RestPasswordScreen({super.key, this.passingEmail});
  final ScreenUtil screenUtil = ScreenUtil();
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmNewPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RestPasswordController _restPasswordController =
      RestPasswordController();

  final Animation_Controller _animationController = Animation_Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
              child: ArrowBackIcon(
                ontap: () {
                  Get.to(ForgotPasswordView());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      "assets/icons/152 - 38 Valu Clean Care Site Logo 02.png"),
                  SizedBox(
                    height: screenUtil.setHeight(10),
                  ),
                  const Text("Slogan for Value cleaning"),
                  SizedBox(
                    height: screenUtil.setHeight(50),
                  ),
                  Text(
                    "Rest password ",
                    style: TextStyle(fontSize: 18, color: ColorApp.primary),
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(10),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: formKey,
                      child: Column(children: [
                        CustomTextFormFieldPassword(
                          text: 'New password',
                          controllerTwo: newPassword,
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(10),
                        ),
                        CustomTextFormFieldPassword(
                          text: 'Confirm password',
                          controllerTwo: confirmNewPassword,
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(30),
                        ),
                        CustomButtom(
                          text: 'Change',
                          color: ColorApp.primary,
                          screenUtil: screenUtil,
                          color1: Colors.white,
                          ontap: () async {
                            _animationController.loder();
                            await Future.delayed(Duration(seconds: 3));
                            if (formKey.currentState!.validate()) {
                              if (newPassword.text == confirmNewPassword.text) {
                                final status =
                                    await _restPasswordController.restPassword(
                                        email: passingEmail ?? '',
                                        newPassword: newPassword.text,
                                        confirmPassword:
                                            confirmNewPassword.text,
                                        context: context);
                                Get.off(
                                    () => LoginView(
                                          passEmail: passingEmail,
                                          passpassword: newPassword.text,
                                        ),
                                    transition: Transition.fade,
                                    duration:
                                        const Duration(milliseconds: 1000));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Passwords Not Matches')));
                              }
                            }
                            _animationController.loder();
                          },
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(30),
                        ),
                      ]),
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
        GetBuilder<Animation_Controller>(builder: (controller) {
          if (controller.loderShow) {
            return const Loder();
          } else {
            return const SizedBox();
          }
        }),
      ]),
    ));
  }
}

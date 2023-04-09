import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/animation/loder.dart';
import 'package:vc/controller/animation_controller.dart';
import 'package:vc/controller/authentication_controller/code_confirm_controller.dart';
import 'package:vc/controller/authentication_controller/forget_password_controller.dart';
import 'package:vc/view/auth_view/rest_password.dart';
import 'package:vc/widgets/custom_buttom.dart';
import '../../theme/constant/const_colors.dart';
import '../../widgets/arrow_back_icons.dart';
import '../../widgets/custom_textform_field.dart';
import 'forgot_password.dart';

// ignore: must_be_immutable
class CodeConfirmView extends StatelessWidget {
  final String? passingEmail;
  CodeConfirmView({super.key, this.passingEmail});
  ScreenUtil screenUtil = ScreenUtil();
  // ignore: unused_field
  final TextEditingController code = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Animation_Controller _controller = Get.put(Animation_Controller());
  final CodeConfirmController _codeController = CodeConfirmController();
  final ForgetPasswordController _resendController = ForgetPasswordController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
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
                  const Text("Slogan for Value cleaning"),
                  SizedBox(
                    height: screenUtil.setHeight(70),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "we send code to verify your email ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: formKey,
                      child: Column(children: [
                        CustomTextFormField(
                          text: 'Enter code ',
                          controller: code,
                          type: TextInputType.name,
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(30),
                        ),
                        CustomButtom(
                          text: 'Confirm',
                          color: ColorApp.primary,
                          screenUtil: screenUtil,
                          color1: Colors.white,
                          ontap: () async {
                            _controller.loder();
                            if (formKey.currentState!.validate()) {
                              final status = await _codeController.checkCode(
                                context: context,
                                email: passingEmail!,
                                code: code.text,
                              );

                              if (status) {
                                Get.off(
                                  () => RestPasswordScreen(
                                    passingEmail: passingEmail!,
                                  ),
                                  transition: Transition.leftToRight,
                                  duration: const Duration(milliseconds: 1000),
                                );
                              }
                            }
                            _controller.loder();
                          },
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(30),
                        ),
                        const Text(
                          "didn't receive the code ?",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(10),
                        ),
                        InkWell(
                          onTap: () async {
                            _controller.loder();
                            final status =
                                await _resendController.forgetPassword(
                              context: context,
                              email: passingEmail!,
                            );

                            _controller.loder();
                          },
                          child: Text(
                            "resend code",
                            style: TextStyle(
                                fontSize: 14, color: ColorApp.primary),
                          ),
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

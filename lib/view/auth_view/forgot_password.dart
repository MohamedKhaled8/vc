import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/animation/loder.dart';
import 'package:vc/controller/animation_controller.dart';
import 'package:vc/controller/authentication_controller/forget_password_controller.dart';
import 'package:vc/view/auth_view/code%20_confirm_view.dart';

import '../../theme/constant/const_colors.dart';
import '../../widgets/arrow_back_icons.dart';
import '../../widgets/custom_textform_field.dart';
import '../../widgets/cutom_buttom_two.dart';
import 'login_view.dart';

// ignore: must_be_immutable
class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});
  ScreenUtil screenUtil = ScreenUtil();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final Animation_Controller _controller = Get.put(Animation_Controller());
  final ForgetPasswordController _forgetController = ForgetPasswordController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                child: ArrowBackIcon(
                  ontap: () {
                    Get.back();
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
                      height: screenUtil.setHeight(30),
                    ),
                    Text(
                      "Forgot password ?",
                      style: TextStyle(fontSize: 18, color: ColorApp.primary),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                    const Text(
                      "Dont Worry! it's happening ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(40),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Form(
                        child: Column(children: [
                          CustomTextFormField(
                            type: TextInputType.text,
                            controller: email,
                            text: 'Enter email/ Phone number',
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(40),
                          ),
                          CustomButtonTWo(
                            onTap: () async {
                              _controller.loder();

                              if (formKey.currentState!.validate()) {
                                final status =
                                    await _forgetController.forgetPassword(
                                  email: email.text,
                                  context: context,
                                );

                                if (status) {
                                  Get.off(
                                    () => CodeConfirmView(
                                      passingEmail: email.text,
                                    ),
                                    transition: Transition.leftToRight,
                                    duration:
                                        const Duration(milliseconds: 1000),
                                  );
                                }
                              }
                              _controller.loder();
                            },
                            screenUtil: screenUtil,
                            txt: 'Submit',
                            color: ColorApp.primary,
                            color1: Colors.white,
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
      ),
    ));
  }
}

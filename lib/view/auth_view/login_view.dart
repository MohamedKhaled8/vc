import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/animation/loder.dart';
import 'package:vc/controller/animation_controller.dart';
import 'package:vc/controller/authentication_controller/auth_controller.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/view/transport_view/transport_companies.dart';
import 'package:vc/view/auth_view/auth_view.dart';
import 'package:vc/view/home_view/bottom_nav_bar.dart';
import '../../controller/authentication_controller/login_controller.dart';
import '../../controller/chat/chat_controller.dart';
import '../../helper/caching_data.dart';
import '../../model/chat/check_room_model.dart';
import '../../widgets/arrow_back_icons.dart';
import '../../widgets/checkbox.dart';
import '../../widgets/custom_textform_field.dart';
import '../../widgets/custom_textformfied _password.dart';
import '../../widgets/cutom_buttom_two.dart';
import 'forgot_password.dart';

class LoginView extends StatelessWidget {
  final String? passEmail;
  final String? passpassword;
  LoginView({super.key, this.passEmail, this.passpassword});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Animation_Controller _controller = Get.put(Animation_Controller());
  final LoginController _loginController = LoginController();
  final ChatController checkRoomController = ChatController();

  @override
  Widget build(BuildContext context) {
    email.text = passEmail ?? '';
    ScreenUtil screenUtil = ScreenUtil();
    final _authController = Get.put(AuthController());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: ArrowBackIcon(
                      ontap: () {
                        Get.to(const AuthAppView());
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                              "assets/icons/152 - 38 Valu Clean Care Site Logo 02.png"),
                          SizedBox(
                            height: screenUtil.setHeight(10),
                          ),
                          Image.asset(
                            "assets/icons/626 - 626 Character Valu Clean.png",
                            height: screenUtil.setHeight(270),
                            width: screenUtil.setHeight(310),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(15),
                          ),
                          Text(
                            "Welcome back",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: ColorApp.primary),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(10),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: Form(
                                child: Column(
                              children: [
                                CustomTextFormField(
                                  controller: email,
                                  type: TextInputType.emailAddress,
                                  validate: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Filed Required';
                                    } else if (!value.contain('@')) {
                                      return 'invalid Email';
                                    }
                                    return null;
                                  },
                                  text: 'Enter email',
                                ),
                                SizedBox(
                                  height: screenUtil.setHeight(20),
                                ),
                                CustomTextFormFieldPassword(
                                  text: 'Enter Password',
                                  controllerTwo: password,
                                ),
                                SizedBox(
                                  height: screenUtil.setHeight(20),
                                ),
                                GetBuilder<AuthController>(builder: (_) {
                                  return Row(
                                    children: [
                                      chcekBox(controller: _authController),
                                      const Text(
                                        "Remember me",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        width: screenUtil.setWidth(40),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(
                                            ForgotPasswordView(),
                                            duration: const Duration(
                                                milliseconds: 1000),
                                            transition: Transition.rightToLeft,
                                          );
                                        },
                                        child: const Text(
                                          " forgot password ?",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                                SizedBox(height: screenUtil.setHeight(20)),
                                CustomButtonTWo(
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      _controller.loder();

                                      final status =
                                          await _loginController.login(
                                        context: context,
                                        email: email.text,
                                        password: password.text,
                                      );

                                      if (status != null &&
                                          status.success &&
                                          status.userData.type == 'user') {
                                        Get.off(
                                          () =>  BottomNavBar(),
                                          transition: Transition.zoom,
                                          duration: const Duration(
                                              milliseconds: 1000),
                                        );
                                      } else if (status != null &&
                                          status.success &&
                                          status.userData.type != 'user') {
                                        Get.off(
                                          () => TransportCompaniesScreen(),
                                          transition: Transition.zoom,
                                          duration: const Duration(
                                              milliseconds: 1000),
                                        );
                                      }

                                      _controller.loder();
                                    }
                                  },
                                  screenUtil: screenUtil,
                                  txt: 'Login',
                                  color: ColorApp.primary,
                                  color1: Colors.white,
                                ),
                                SizedBox(height: screenUtil.setHeight(20)),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Divider(
                                      height: screenUtil.setHeight(20),
                                      color: Colors.black,
                                    )),
                                    const Text(
                                      " or login with  ",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Expanded(
                                        child: Divider(
                                      height: screenUtil.setHeight(20),
                                      color: Colors.black,
                                    )),
                                  ],
                                ),
                                SizedBox(height: screenUtil.setHeight(10)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset("assets/icons/Google.png"),
                                    Image.asset("assets/icons/facebook.png"),
                                  ],
                                ),
                              ],
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
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
        ),
      ),
    );
  }
}

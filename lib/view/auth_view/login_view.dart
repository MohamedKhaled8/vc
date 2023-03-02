import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/view/auth_view/auth_view.dart';
import 'package:vc/view/auth_view/signup_view.dart';
import '../../controller/auth_controller.dart';
import '../../widgets/arrow_back_icons.dart';
import '../../widgets/checkbox.dart';
import '../../widgets/custom_textform_field.dart';
import '../../widgets/custom_textformfied _password.dart';
import '../../widgets/cutom_buttom_two.dart';
import 'forgot_password.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    final controller = Get.put(AuthController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ArrowBackIcon(ontap: () {
              Get.to(const AuthAppView());
            },),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/Agora cleaning.png"),
                    const Text("Slogan for Agora cleaning"),
                    SizedBox(
                      height: screenUtil.setHeight(30),
                    ),
                    Text(
                      "Welcome back",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorApp.primary),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(40),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Form(
                          child: Column(
                        children: [
                          CustomTextFormField(
                            text: 'Enter email',
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(20),
                          ),
                          CustomTextFormFieldPassword(
                            text: 'Enter Password',
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(20),
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return Row(
                              children: [
                                chcekBox(controller: controller),
                                const Text(
                                  "Remember me",
                                  style: TextStyle(fontSize: 14),
                                ),
                                 SizedBox(
                                  width:screenUtil.setWidth(40) ,
                                ),
                                InkWell(
                                  onTap: (){
                                    Get.to(ForgotPasswordView());
                                  },
                                  child: const Text(
                                    " forgot password ?",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            );
                          }),
                                SizedBox(height: screenUtil.setHeight(20)),
                       customButtomTWo(
                          ontap: () {
                            Get.to(SignUpView());
                          },
                          screenUtil: screenUtil,
                          txt: 'Sign up',
                          color: ColorApp.primary,
                          color1: Colors.white,
                        ),
                              SizedBox(height: screenUtil.setHeight(20)),
                          const Text("OR SIGN IN WITH" , style: TextStyle(fontSize: 14),),
                        SizedBox(height: screenUtil.setHeight(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      ),
    );
  }
}



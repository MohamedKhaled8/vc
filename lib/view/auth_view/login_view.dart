import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/view/auth_view/auth_view.dart';
import 'package:vc/view/home_view/bottom_nav_bar.dart';
import '../../controller/auth_controller.dart';
import '../../widgets/arrow_back_icons.dart';
import '../../widgets/checkbox.dart';
import '../../widgets/custom_textform_field.dart';
import '../../widgets/custom_textformfied _password.dart';
import '../../widgets/cutom_buttom_two.dart';
import 'forgot_password.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});
  final TextEditingController email= TextEditingController();
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();


   @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    final controller = Get.put(AuthController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 40),
                child: ArrowBackIcon(ontap: () {
                  Get.to(const AuthAppView());
                },),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/Agora cleaning.png"),
                      SizedBox(
                        height: screenUtil.setHeight(10),
                      ),
                      const Text("Slogan for Agora cleaning"),
                      SizedBox(
                        height: screenUtil.setHeight(40),
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
                                  return 'املاء المطوب';
                                }
                                else if (!value.contain('@')){
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
                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              );
                            }),
                                  SizedBox(height: screenUtil.setHeight(20)),
                           CustomButtonTWo(
                            onTap: () {
                              if(formKey.currentState!.validate()){
                                Get.to(()=>BottomNavBar());
                              }
                            },
                            screenUtil: screenUtil,
                            txt: 'Login',
                            color: ColorApp.primary,
                            color1: Colors.white,
                          ),
                                SizedBox(height: screenUtil.setHeight(20)),
                            Row(
                              children: const [
                                Expanded(child: Divider(height: 20,color: Colors.black,)),
                                Text(" or login with  " , style: TextStyle(fontSize: 14),),
                                Expanded(child: Divider(height: 2,color: Colors.black,)),
                              ],
                            ),
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
      ),
    );
  }
}



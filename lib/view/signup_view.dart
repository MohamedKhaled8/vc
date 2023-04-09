// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/animation/loder.dart';
import 'package:vc/controller/animation_controller.dart';
import 'package:vc/controller/authentication_controller/auth_controller.dart';
import 'package:vc/controller/authentication_controller/register_controller.dart';

import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/view/auth_view/auth_view.dart';
import 'package:vc/view/auth_view/login_view.dart';

import '../../controller/company/company_register_controller.dart';
import '../../widgets/arrow_back_icons.dart';
import '../../widgets/custom_textform_field.dart';
import '../../widgets/custom_textformfied _password.dart';
import '../../widgets/cutom_buttom_two.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  ScreenUtil screenUtil = ScreenUtil();
  final TextEditingController fName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController companyId = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordConfirme = TextEditingController();
  final TextEditingController address = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Animation_Controller _controller = Get.put(Animation_Controller());
  final AuthController _authController = Get.put(AuthController());
  final RegisterController _signUpController = Get.put(RegisterController());
  final CompanyRegisterController _signUpCompanyController =
      Get.put(CompanyRegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenUtil.setHeight(60),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: ArrowBackIcon(
                  ontap: () {
                    Get.to(const AuthAppView());
                  },
                ),
              ),
              Column(
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: ColorApp.primary),
                  ),
                  const Text(
                    "Create your account",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: GetBuilder<RegisterController>(
                          init: RegisterController(),
                          builder: (_) {
                            return Row(
                              children: [
                                Flexible(
                                  child: RadioListTile(
                                    value: 'company',
                                    groupValue: _.groupValue,
                                    selected: _.companyAccount,
                                    toggleable: _.companyAccount,
                                    activeColor: ColorApp.primary,
                                    onChanged: (value) {
                                      _.checkAccountType(
                                          selectedAccount: value.toString());
                                    },
                                    title: const Text('Company'),
                                  ),
                                ),
                                Flexible(
                                  child: RadioListTile(
                                    value: 'user',
                                    selected: _.userAccount,
                                    activeColor: ColorApp.primary,
                                    toggleable: _.userAccount,
                                    groupValue: _.groupValue,
                                    onChanged: (value) {
                                      _.checkAccountType(
                                          selectedAccount: value.toString());
                                    },
                                    title: const Text('user'),
                                  ),
                                ),
                              ],
                            );
                          })),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 10, bottom: 30),
                      child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextFormField(
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Filed Required';
                                  }
                                  return null;
                                },
                                controller: fName,
                                type: TextInputType.name,
                                text: 'Enter full name',
                              ),
                              SizedBox(height: screenUtil.setHeight(20)),
                              CustomTextFormField(
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Filed Required';
                                  }
                                  return null;
                                },
                                controller: address,
                                type: TextInputType.name,
                                text: 'Enter address',
                              ),
                              SizedBox(height: screenUtil.setHeight(20)),
                              CustomTextFormField(
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Filed Required';
                                  }
                                  return null;
                                },
                                controller: phone,
                                type: TextInputType.number,
                                text: 'Enter phone number',
                              ),
                              SizedBox(height: screenUtil.setHeight(20)),
                              CustomTextFormField(
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Filed Required';
                                  }
                                },
                                controller: email,
                                type: TextInputType.emailAddress,
                                text: 'Enter email',
                              ),
                              SizedBox(height: screenUtil.setHeight(20)),
                              GetBuilder<RegisterController>(builder: (_) {
                                if (_.companyAccount) {
                                  return Column(
                                    children: [
                                      CustomTextFormField(
                                        validate: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Filed Required';
                                          }
                                          return null;
                                        },
                                        controller: companyId,
                                        type: TextInputType.text,
                                        text: 'Enter Company Id',
                                      ),
                                      SizedBox(
                                          height: screenUtil.setHeight(20)),
                                    ],
                                  );
                                } else {
                                  return SizedBox();
                                }
                              }),
                              CustomTextFormFieldPassword(
                                text: 'Enter Password',
                                controllerTwo: password,
                              ),
                              SizedBox(height: screenUtil.setHeight(20)),
                              CustomTextFormFieldPassword(
                                text: 'Confirm password',
                                controllerTwo: passwordConfirme,
                              ),
                              SizedBox(height: screenUtil.setHeight(20)),
                              CustomButtonTWo(
                                onTap: () async {
                                  _controller.loder();
                                  if (formKey.currentState!.validate()) {
                                    if (_signUpController.userAccount) {
                                      final status =
                                          await _signUpController.register(
                                              context: context,
                                              name: fName.text,
                                              email: email.text,
                                              address: address.text,
                                              phone: phone.text,
                                              password: password.text,
                                              passwordConfirmation:
                                                  passwordConfirme.text);
                                      if (status!) {
                                        Get.off(
                                          LoginView(
                                            passEmail: email.text,
                                            passpassword: password.text,
                                          ),
                                          transition: Transition.leftToRight,
                                          duration: const Duration(
                                              milliseconds: 1000),
                                        );
                                      }
                                    } else {
                                      final status =
                                          await _signUpCompanyController
                                              .companyRegister(
                                                  context: context,
                                                  name: fName.text,
                                                  email: email.text,
                                                  address: address.text,
                                                  phone: phone.text,
                                                  password: password.text,
                                                  passwordConfirmation:
                                                      passwordConfirme.text,
                                                  companyId: companyId.text);
                                      if (status!) {
                                        Get.off(
                                          LoginView(
                                            passEmail: email.text,
                                            passpassword: password.text,
                                          ),
                                          transition: Transition.leftToRight,
                                          duration: const Duration(
                                              milliseconds: 1000),
                                        );
                                      }
                                    }
                                  }
                                  _controller.loder();
                                },
                                screenUtil: screenUtil,
                                txt: 'Sign up',
                                color: ColorApp.primary,
                                color1: Colors.white,
                              ),
                              SizedBox(height: screenUtil.setHeight(10)),
                              Row(
                                children: [
                                  Expanded(
                                      child: Divider(
                                    height: screenUtil.setHeight(20),
                                    color: Colors.black,
                                  )),
                                  const Text(
                                    "  OR SIGN IN WITH  ",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Expanded(
                                      child: Divider(
                                    height: screenUtil.setHeight(2),
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
                    ),
                  )
                ],
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
    );
  }
}

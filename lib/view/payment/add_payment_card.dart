import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/animation/loder.dart';
import 'package:vc/controller/animation_controller.dart';
import 'package:vc/controller/payment_controller.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/widgets/custom_containert_top_screen.dart';
import 'package:vc/widgets/custom_textform_field.dart';
import '../../widgets/cutom_buttom_two.dart';

class AddPaymentCard extends StatelessWidget {
  AddPaymentCard({Key? key}) : super(key: key);
  final ScreenUtil screenUtil = ScreenUtil();
  final TextEditingController number = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController cv = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final PaymentController _addPayment = PaymentController();
  final Animation_Controller _controller = Animation_Controller();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomContainerTopScreen(
                      ontap: () {
                        Get.back();
                      },
                      text: "Add Payment Card",
                      screenUtil: screenUtil,
                      size: 130,
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(50),
                    ),
                    const Text(
                      '     Add new card',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(30),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: screenUtil.setHeight(250),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 3,
                            spreadRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                CustomTextFormField(
                                  validate: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Filed Required';
                                    }
                                    return null;
                                  },
                                  maxLen: 16,
                                  text: 'Number',
                                  controller: number,
                                  icon: const Icon(Icons.payment_outlined),
                                  type: TextInputType.number,
                                ),
                                SizedBox(
                                  height: screenUtil.setHeight(20),
                                ),
                                CustomTextFormField(
                                  validate: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Filed Required';
                                    }
                                    return null;
                                  },
                                  text: 'Cardholder name',
                                  type: TextInputType.name,
                                  controller: name,
                                ),
                                SizedBox(
                                  height: screenUtil.setHeight(20),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                        width: screenUtil.setWidth(150),
                                        child: CustomTextFormField(
                                          validate: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Filed Required';
                                            }
                                            return null;
                                          },
                                          text: 'MM / YY',
                                          type: TextInputType.datetime,
                                          controller: date,
                                          maxLen: 7,
                                          visaData: true,
                                        )),
                                    SizedBox(
                                      height: screenUtil.setWidth(20),
                                    ),
                                    SizedBox(
                                      width: screenUtil.setWidth(150),
                                      child: CustomTextFormField(
                                        validate: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Filed Required';
                                          }
                                          return null;
                                        },
                                        text: 'cvc / cvv',
                                        controller: cv,
                                        type: TextInputType.number,
                                        maxLen: 3,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(20),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Checkbox(
                              value: true,
                              onChanged: (value) {},
                              activeColor: ColorApp.primary,
                              checkColor: Colors.white),
                          const Text(
                            'Save card',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GetBuilder<Animation_Controller>(builder: (controller) {
                if (controller.loderShow) {
                  return const Loder();
                } else {
                  return const SizedBox();
                }
              }),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: screenUtil.setHeight(60),
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(0, 3),
                  spreadRadius: 3,
                  blurRadius: 5,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: CustomButtonTWo(
              screenUtil: screenUtil,
              color: ColorApp.primary,
              color1: Colors.white,
              txt: 'Add Card',
              onTap: () async {
                try {
                  _controller.loder();

                  if (formKey.currentState!.validate()) {
                    final data = await _addPayment.addPaymentCard(
                      context: context,
                      number: number.text,
                      expMonth: date.text.substring(0, 2),
                      expYear: date.text.substring(3, 7),
                      cvc: cv.text,
                    );
                  }
                } finally {
                  _controller.loder();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:vc/helper/end_points.dart';
import 'package:vc/model/orders/finished_order_model.dart';
import 'package:vc/widgets/container_shadow.dart';

import '../../controller/myController.dart';
import '../../controller/review_controller.dart';
import '../../theme/constant/const_colors.dart';
import '../../theme/constant/sized.dart';
import '../../widgets/custom_containert_top_screen.dart';
import '../../widgets/cutom_buttom_two.dart';
import '../../widgets/popup.dart';

class RateExperience extends StatefulWidget {
  final FinishedOrder orderInfo;
  const RateExperience({Key? key, required this.orderInfo}) : super(key: key);

  @override
  State<RateExperience> createState() => _RateExperienceState();
}

class _RateExperienceState extends State<RateExperience> {
  final controller = Get.put(MyController());
  final ReviewController reviewController = ReviewController();
  late num ratings;
  final TextEditingController reviewTextController= TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CustomContainerTopScreen(
                  text: "Rate Experience",
                  screenUtil: screenUtil,
                  size: 150,
                ),
              ],
            ),
            SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: screenUtil.setHeight(50),
                        ),
                        Container(
                          height: screenUtil.setHeight(120),
                          width: screenUtil.setWidth(120),
                          decoration: BoxDecoration(
                              color: const Color(0xff20843C).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                image: AssetImage("assets/icons/cleaning 1.png"),
                              )),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(15),
                        ),
                        Text(
                          widget.orderInfo.service![0].title.toString(),
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(25),
                        ),
                        const Text(
                          'Rate overall exprience',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(20),
                        ),
                        GetBuilder<MyController>(builder: (_) {
                          return RatingBar(
                              ratingWidget: RatingWidget(
                                full: Icon(
                                  Icons.star,
                                  color: ColorApp.starTrue,
                                ),
                                half: const Icon(
                                  Icons.star,
                                ),
                                empty: Icon(
                                  Icons.star_border,
                                  color: ColorApp.starFalse,
                                ),
                              ),
                              onRatingUpdate: (ratingValue) {
                                setState(() {
                                  ratings = ratingValue;
                                });
                              });
                        }),
                      ],
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(20),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: screenUtil.setHeight(200),
                      decoration: buildShadowContainer(
                          borderRadius: BorderRadius.circular(15)),
                      child: TextFormField(
                        controller: reviewTextController,
                        autofocus: false,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        maxLines: 8,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          hintText: 'write some thing ...',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: screenUtil.setHeight(50),
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: CustomButtonTWo(
            screenUtil: screenUtil,
            color: ColorApp.primary,
            color1: Colors.white,
            txt: 'Submit Feedback',
            // AssetImage:  "assets/icons/schedule2.png",
            onTap: () async{
              if (formKey.currentState!.validate()) {
                reviewController.addReview(comments: reviewTextController.text, starRating: ratings.toString(), serviceId: widget.orderInfo.service![0].id.toString(), context: context,url: EndPointName.CREATEREVIEWSERVICE);
                await showDialog(
                context: context,
                builder: (context) => Container(
                  margin: const EdgeInsets.only(bottom: 150),
                  child: const PopUp(
                    titleFristChat: 'T',
                    titlePartTwo: 'HANKS FOR YOUR REVIEW OUR SERRVICE',
                    image: 'assets/images/json/success_payment.json',
                    orderID: '165498753',
                    btnText: 'Done',
                  ),
                ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

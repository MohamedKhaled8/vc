import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/model/orders/finished_order_model.dart';
import 'package:vc/view/rating/rate_experience.dart';
import 'package:vc/widgets/container_shadow.dart';
import '../../controller/myController.dart';
import '../../controller/review_controller.dart';
import '../../helper/end_points.dart';
import '../../theme/constant/const_colors.dart';
import '../../widgets/custom_containert_top_screen.dart';
import '../../widgets/cutom_buttom_two.dart';

class RateWorker extends StatefulWidget {
  final FinishedOrder orderInfo;
  const RateWorker({Key? key, required this.orderInfo}) : super(key: key);

  @override
  State<RateWorker> createState() => _RateWorkerState();
}

class _RateWorkerState extends State<RateWorker> {
  final ScreenUtil screenUtil = ScreenUtil();

  final controller = Get.put(MyController());

  late num ratings;
  final ReviewController reviewWorkersController = ReviewController();
  final TextEditingController reviewWorkerTextController= TextEditingController();

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
                                image:
                                    AssetImage("assets/icons/cleaning 1.png"),
                              )),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(15),
                        ),
                         Text(
                          widget.orderInfo.service![0].workers![0].name,
                          style: TextStyle(
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
                        controller: reviewWorkerTextController,
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
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
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
            txt: 'Next',
            onTap: () {
              if (formKey.currentState!.validate()) {
                reviewWorkersController.addWorkerReview(comments: reviewWorkerTextController.text, starRating: ratings.toString(), workerId: widget.orderInfo.service![0].workers![0].id.toString(), context: context,url: EndPointName.CREATEWORKERREVIEW);
                Get.to(()=>RateExperience(orderInfo: widget.orderInfo),);

              }
            },
          ),
        ),
      ),
    );
  }
}

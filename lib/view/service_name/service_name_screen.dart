// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/controller/favorite_controller.dart';
import 'package:vc/model/jobs_done_model.dart';
import 'package:vc/model/top_service_model.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/view/home_view/home.dart';
import 'package:vc/view/service_name/review_screen.dart';
import 'package:vc/widgets/container_shadow.dart';
import 'package:vc/widgets/rating.dart';
import '../../controller/jobs_done_controller.dart';
import '../../controller/myController.dart';
import '../../model/services_model/user_home_model.dart';
import '../../widgets/arrow_back_icons.dart';
import 'card_detailes_view.dart';
import '../../widgets/custom_buttom_navbar.dart';

class ServiceNameScreen extends StatelessWidget {
  final Service serviceModel;
  final bool? isfavorite;

  const ServiceNameScreen({
    Key? key,
    required this.serviceModel,
    this.isfavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    final controller = Get.put(MyController());
    final FavoriteController _favoController = FavoriteController();
    final JobsDoneController jobsDoneController = JobsDoneController();
    bool _is_favorite = isfavorite ?? serviceModel.is_favorite!;

    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: screenUtil.setHeight(300),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/icons/backg1.jpg"),
                fit: BoxFit.cover,
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ArrowBackIcon(
                  color: Colors.white,
                  ontap: () {
                    Get.back(
                        result: HomeView(
                      is_favorite: _is_favorite,
                    ));
                  },
                ),
                FavoriteButton(
                  isFavorite: _is_favorite,
                  iconSize: 45,
                  valueChanged: (value) {
                    _is_favorite = value;
                    if (value) {
                      _favoController.addFavorite('en',context: context,
                          serviceId: serviceModel.id.toString());
                    } else {
                      _favoController.deleteFavorite(
                      context: context,
                        id: serviceModel.id.toString(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 180,
            child: Container(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 30),
              width: MediaQuery.of(context).size.width,
              height: screenUtil.setHeight(800),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${serviceModel.title} ",
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${serviceModel.price} \$ hr",
                          style:
                              TextStyle(color: ColorApp.primary, fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(height: screenUtil.setHeight(20)),
                    CustomRating(
                      textColor: Colors.black,
                      initialRating: serviceModel.rate!.toDouble(),
                      serviceID: serviceModel.id!,
                      size: 30,
                    ),
                    SizedBox(height: screenUtil.setHeight(30)),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "About this service",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(height: screenUtil.setHeight(10)),
                    GetBuilder<MyController>(builder: (_) {
                      return Column(
                        children: [
                          Text(
                            serviceModel.description!,
                            style: const TextStyle(fontSize: 16),
                            maxLines: controller.isShowMore ? 4 : null,
                            overflow: TextOverflow.ellipsis,
                          ),
                          TextButton(
                              onPressed: () {
                                controller.isShowMoree();
                              },
                              child: Text(
                                controller.isShowMore
                                    ? "Read less"
                                    : "Read more",
                                style: TextStyle(
                                    fontSize: 18, color: ColorApp.primary),
                              )),
                        ],
                      );
                    }),
                    SizedBox(height: screenUtil.setHeight(10)),
                    FutureBuilder(
                        future: jobsDoneController.jobsDone(context: context, id: serviceModel.id.toString()),
                        builder: (context,snapshot){
                      if(snapshot.hasData&&snapshot.connectionState==ConnectionState.done){
                        final JobsDoneModel jobsDoneModel = snapshot.data as JobsDoneModel;
                        return Container(
                          height: screenUtil.setHeight(55),
                          width: screenUtil.setWidth(358),
                          decoration: buildShadowContainer(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Jobs done",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.normal),
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                width: screenUtil.setWidth(100),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: ColorApp.primary,
                                ),
                                child:  Center(
                                  child: Text(
                                    jobsDoneModel.jobDone.toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );

                      }else{
                        return const SizedBox();
                      }
                    }),
                    SizedBox(
                      height: screenUtil.setHeight(30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(
                                  ReviewScreen(
                                    reviewInfo: serviceModel.review!,
                                  ),
                                  transition: Transition.rightToLeft,
                                  duration: const Duration(milliseconds: 1000),
                                );
                              },
                              child: const Text(
                                "Reviews",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: screenUtil.setWidth(15)),
                            Text(
                              "(${serviceModel.review!.length})",
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(
                                () => ReviewScreen(
                                      reviewInfo: serviceModel.review ?? [],
                                    ),
                                transition: Transition.rightToLeft,
                                duration: const Duration(milliseconds: 1000));
                          },
                          child: Text(
                            "See all",
                            style: TextStyle(color: ColorApp.primary),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(20),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(176),
                      child: ListView.builder(
                          itemCount: serviceModel.review!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ReviewCardDetails(
                              reviewInfo: serviceModel.review![index],
                              screenUtil: screenUtil,
                              controller: controller,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: CustomButtomNavBar(
        serviceModel: serviceModel,
        screenUtil: screenUtil,
      ),
    );
  }

  dynamic setImage({required int index}) {
    if (serviceModel.images != null && serviceModel.images!.contains('http')) {
      return NetworkImage(serviceModel.images!);
    }
  }
}

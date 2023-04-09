import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vc/controller/user_home_controller.dart';
import 'package:vc/model/services_model/top_service_model.dart';
import 'package:vc/model/services_model/user_home_model.dart';
import 'package:vc/model/top_service_model.dart';
import 'package:vc/view/home_view/appbar_home.dart';
import 'package:vc/view/home_view/offer_home_builder.dart';
import '../../animation/home_shimmer.dart';
import '../../widgets/action_card.dart';
import '../../widgets/circle_card.dart';
import '../../widgets/cont_card.dart';
import '../../widgets/search_bar.dart';

class HomeView extends StatelessWidget {
  final bool? is_favorite;

  const HomeView({super.key, this.is_favorite});

  static final UserHomeController _homeController = UserHomeController();

  @override
  Widget build(BuildContext context) {
    final UserHomeController _homeController = UserHomeController();
    ScreenUtil screenUtil = ScreenUtil();

    return FutureBuilder(
      future: _homeController.userHome(context: context),
      // : CachingData.cachingUserHomeData(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final UserHomeModel homeData = snapshot.data as UserHomeModel;
          return Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        AppBarHome(
                            user: true,
                            userName: _homeController.userData!.userData.name,
                            userImage: _homeController
                                        .userData!.userData.photo.length <=
                                    0
                                ? 'assets/images/png/user.png'
                                : _homeController.userData!.userData.photo,
                            screenUtil: screenUtil),
                        SizedBox(
                          height: screenUtil.setHeight(20),
                        ),
                        SearchBar(
                          screenUtil: screenUtil,
                          shearchServiceLsit: homeData.service ?? [],
                        ),
                        homeData.announcement!.isNotEmpty
                            ? Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 16),
                                height: screenUtil.setHeight(155),
                                width: double.infinity,
                                child: OffersHomeBuilder(
                                  offers: homeData.announcement ?? [],
                                ),
                              )
                            : const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'No announcement yet',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                        SizedBox(
                          height: screenUtil.setHeight(10),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "All Category",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(10),
                        ),
                        homeData.categories!.isNotEmpty
                            ? ContCard(
                                shimmer: false,
                                categories: homeData.categories ?? [],
                                screenUtil: screenUtil)
                            : const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'No categories yet',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                        SizedBox(
                          height: screenUtil.setHeight(15),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Our Services",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(10),
                        ),
                        CircleCard(
                          serviceList: homeData.service ?? [],
                          screenUtil: screenUtil,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(20),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Top Services",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: _homeController.topService(context: context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.connectionState == ConnectionState.done) {
                          final topServiceData =
                              snapshot.data as TopServiceModel;
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return ActionCard(
                                is_favorite: is_favorite,
                                serviceModel: homeData.service![index],
                                topServiceModel: TopServiceModelCard(
                                  id: topServiceData.data![index].id!,
                                  title: topServiceData.data![index].title!,
                                  image: topServiceData.data![index].images!,
                                  rate: topServiceData
                                              .data![index].review!.length >
                                          0
                                      ? topServiceData
                                          .data![index].review![0].rating
                                          .toDouble()
                                      : 0,
                                  price: homeData.service![index].price!
                                      .toDouble(),
                                  is_favorite:
                                      homeData.service![index].is_favorite!,
                                ),
                              );
                            },
                            itemCount: homeData.service?.length ?? 0,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          );
                        } else {
                          return const SizedBox();
                        }
                      }),
                ],
              ),
            ),
            // bottomNavigationBar: BottomNavBar(),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 218, 218, 218),
            highlightColor: const Color.fromARGB(255, 244, 244, 244),
            child: const HomeShimmer(),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}

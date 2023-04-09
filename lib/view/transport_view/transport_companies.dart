import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/controller/company/get_company_controller.dart';
import 'package:vc/controller/user_home_controller.dart';
import 'package:vc/model/company/all_compaany_model.dart';
import 'package:vc/model/services_model/user_home_model.dart';
import 'package:vc/model/transport_companies_model.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/theme/constant/sized.dart';
import 'package:vc/view/transport_view/transport_card_widgets.dart';
import 'package:vc/view/transport_view/transport_companies_see_all.dart';
import 'package:vc/view/home_view/appbar_home.dart';
import 'package:vc/view/home_view/offer_home_builder.dart';
import 'package:vc/widgets/cont_card.dart';
import 'package:vc/widgets/search_bar.dart';

class TransportCompaniesScreen extends StatelessWidget {
   TransportCompaniesScreen({super.key});
  final GetCompanyController getCompanyController = GetCompanyController();

  @override
  Widget build(BuildContext context) {
     AllCompanyModel? companyModel;
    final UserHomeController _homeController = UserHomeController();

    return FutureBuilder(
      future: _homeController.userHome(context: context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final UserHomeModel homeData = snapshot.data as UserHomeModel;

          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          AppBarHome(
                              user: false,
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
                            iconSize: 40,
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
                                  padding: EdgeInsets.all(30),
                                  child: Text(
                                    'No announcement yet',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    'No categories yet',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                          SizedBox(
                            height: screenUtil.setHeight(15),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Transport Companies",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(
                                    () =>  TransportCompaniesSeeAll(),
                                    transition: Transition.zoom,
                                    duration:
                                        const Duration(milliseconds: 1000),
                                  );
                                },
                                child: Text(
                                  "See all",
                                  style: TextStyle(
                                      fontSize: 18, color: ColorApp.primary),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(10),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(20),
                    ),
                    FutureBuilder(
                      future: getCompanyController.allCompany(context: context),
                      builder: ((context,snapshot){
                        if(snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData){
                           companyModel = snapshot.data as AllCompanyModel;
                          print(snapshot.data);
                          return      ListView.separated(
                            itemBuilder: (context, index) {
                              return TransportCard(
                                transportcompaniesmodel: TransportCompaniesModel(
                                    image: companyModel!.data![index].photo,
                                    title: companyModel!.data![index].name),
                                data: companyModel!.data![index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox();
                            },
                            itemCount: companyModel!.data!.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          );
                        }
                        else{
                          return SizedBox();
                        }
                      }

                      ),
                    ),

                  ],
                ),
              ),
              // bottomNavigationBar: BottomNavBar(),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

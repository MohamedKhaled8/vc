import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vc/model/model_card.dart';
import 'package:vc/model/services_model/user_home_model.dart';
import 'package:vc/model/top_service_model.dart';
import 'package:vc/theme/constant/sized.dart';
import 'package:vc/widgets/action_card.dart';
import 'package:vc/widgets/circle_card.dart';
import 'package:vc/widgets/search_bar.dart';

import '../view/home_view/appbar_home.dart';
import '../view/home_view/offer_home_builder.dart';
import '../widgets/cont_card.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  AppBarHome(
                      user: true,
                      userName: 'Loading...',
                      userImage: 'assets/images/jpeg/mohamed.jpeg',
                      screenUtil: screenUtil),
                  SizedBox(
                    height: screenUtil.setHeight(20),
                  ),
                  SearchBar(
                    screenUtil: screenUtil,
                    shearchServiceLsit: [],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    height: screenUtil.setHeight(155),
                    width: double.infinity,
                    color: Colors.grey,
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
                  ContCard(
                      shimmer: true,
                      categories: List.generate(
                          5,
                          (index) => Categories(
                              id: 1, title: 'title', images: 'images')),
                      screenUtil: screenUtil),
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
                      serviceList: List.generate(
                        7,
                        (index) => Service(
                            title: '', images: 'assets/images/png/service.png'),
                      ),
                      screenUtil: screenUtil),
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
            ListView.separated(
              itemBuilder: (context, index) {
                return ActionCard(
                    serviceModel: Service(
                        title: '',
                        images: '',
                        rate: 4,
                        price: 10,
                        id: 1,
                        is_favorite: false),
                    topServiceModel: TopServiceModelCard(
                        title: '',
                        image: '',
                        rate: 4,
                        price: 10,
                        id: 1,
                        is_favorite: false));
              },
              separatorBuilder: (context, index) {
                return const SizedBox();
              },
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}

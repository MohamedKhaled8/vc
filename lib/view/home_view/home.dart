import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vc/model/model_card.dart';
import '../../widgets/Card_view.dart';
import '../../widgets/action_card.dart';
import '../../widgets/circle_card.dart';
import '../../widgets/cont_card.dart';
import '../../widgets/search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Hi, Dr Code",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Need Some Help ?",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ]),
                      const Spacer(),
                      Container(
                        height: screenUtil.setHeight(50),
                        width: screenUtil.setWidth(50),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/icons/bell.png"))),
                      ),
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage("assets/images/jpeg/mohamed.jpeg"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(20),
                  ),
                  SearchBar(screenUtil: screenUtil),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        height: screenUtil.setHeight(155),
                        width: double.infinity,
                        child: PageView.builder(
                            controller: PageController(viewportFraction: 0.9),
                            itemCount: modelCard.length,
                            itemBuilder: (context, index) {
                              return CardView(
                                modelCard: modelCard[index],
                              );
                            }),
                      )
                    ],
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
                  ContCard(screenUtil: screenUtil),
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
                  CircleCard(screenUtil: screenUtil),
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
                return const ActionCard();
              },
              separatorBuilder: (context, index) {
                return const SizedBox();
              },
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}

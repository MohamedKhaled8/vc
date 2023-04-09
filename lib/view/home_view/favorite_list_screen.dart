import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/model/model_card.dart';
import 'package:vc/model/top_service_model.dart';
import 'package:vc/theme/constant/sized.dart';
import 'package:vc/widgets/action_card.dart';
import 'package:vc/widgets/custom_containert_top_screen.dart';

import '../../model/services_model/user_home_model.dart';

class FavoriteListScreen extends StatelessWidget {
  final Service serviceModel;

  const FavoriteListScreen({super.key, required this.serviceModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Stack(
                children: [
                  CustomContainerTopScreen(
                    ontap: () {
                      Get.back();
                    },
                    screenUtil: screenUtil,
                    text: 'Favorite List',
                    size: 130,
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ActionCard(
                      serviceModel: serviceModel,
                      topServiceModel: TopServiceModelCard(
                          title: 'test',
                          image: 'assets/images/png/service.png',
                          rate: 4,
                          price: 95,
                          id: 5,
                          is_favorite: true),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox();
                  },
                  itemCount: modelCard.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

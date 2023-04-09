import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/controller/search_bar_controller.dart';
import 'package:vc/controller/user_home_controller.dart';
import 'package:vc/model/services_model/top_service_model.dart';
import 'package:vc/model/top_service_model.dart';

import 'package:vc/theme/constant/const_colors.dart';

import 'package:vc/theme/constant/sized.dart';
import 'package:vc/widgets/action_card.dart';

import '../../model/services_model/user_home_model.dart';

class SearchBarFromItems extends StatelessWidget {
  final List<Service> serviceList;

  const SearchBarFromItems({super.key, required this.serviceList});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchBarController());
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            SizedBox(
                                child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Image.asset(
                                "assets/icons/arrow_back.png",
                                color: Colors.black,
                                width: screenUtil.setHeight(40),
                                height: screenUtil.setWidth(50),
                              ),
                            )),
                            GetBuilder<SearchBarController>(builder: (_) {
                              return Expanded(
                                child: SizedBox(
                                  height: screenUtil.setHeight(50),
                                  child: TextField(
                                    controller:
                                        controller.searchEditingController,
                                    onChanged: (value) {
                                      controller.addSearchToList(
                                          value: value,
                                          serviceList: serviceList);
                                    },
                                    cursorColor: Colors.green,
                                    decoration: InputDecoration(
                                      suffixIcon: controller
                                              .searchEditingController
                                              .text
                                              .isNotEmpty
                                          ? Icon(
                                              Icons.search_outlined,
                                              color: ColorApp.primary,
                                              size: 40,
                                            )
                                          : null,
                                      hintText: 'find it here ..........',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.green.shade200,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.green.shade200,
                                            width: 2),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            width: 1, color: Colors.red),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            width: 1, color: Colors.red),
                                      ),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          22, 18, 22, 18),
                                      hintStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Roboto",
                                        fontStyle: FontStyle.normal,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ],
                        )),
                    GetBuilder<SearchBarController>(builder: (_) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          return ActionCard(
                            serviceModel: serviceList[index],
                            topServiceModel: TopServiceModelCard(
                                id: serviceList[index].id!,
                                title: serviceList[index].title!,
                                image: serviceList[index].images!,
                                rate: serviceList[index].review!.length > 0
                                    ? serviceList[index]
                                        .review![0]
                                        .rating!
                                        .toDouble()
                                    : 0,
                                price: serviceList[index].price!.toDouble(),
                                is_favorite: serviceList[index].is_favorite!),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox();
                        },
                        itemCount: serviceList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      );
                    })
                  ],
                ))));
  }
}

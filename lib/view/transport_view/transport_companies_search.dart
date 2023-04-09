import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/controller/search_bar_controller.dart';
import 'package:vc/model/transport_companies_model.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/theme/constant/sized.dart';
import 'package:vc/view/transport_view/transport_card_widgets.dart';

class TransportCompaniesSearchl extends StatelessWidget {

  TransportCompaniesSearchl({super.key});
  final controller = Get.put(SearchBarController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SafeArea(
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
                                controller: controller.searchTextController,
                                onChanged: (value) {
                                  controller.addSearchToListTransport(value);
                                },
                                cursorColor: Colors.green,
                                decoration: InputDecoration(
                                  suffixIcon: controller
                                          .searchTextController.text.isNotEmpty
                                      ? Icon(
                                          Icons.search_outlined,
                                          color: ColorApp.primary,
                                          size: 40,
                                        )
                                      : null,
                                  hintText: 'find it here ..........',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.green.shade200, width: 2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.green.shade200, width: 2),
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
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(22, 18, 22, 18),
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
                SizedBox(
                  height: screenUtil.setHeight(15),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                SizedBox(
                  height: screenUtil.setHeight(15),
                ),
                GetBuilder<SearchBarController>(builder: (_) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return TransportCard(
                        transportcompaniesmodel: TransportCompaniesModel(
                            image: controller
                                .transportcompaniesmodel![index].image,
                            title: controller
                                .transportcompaniesmodel![index].title),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox();
                    },
                    itemCount: transportcompaniesmodel.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  );
                }),
              ],
            )),
      ),
    ));
  }
}

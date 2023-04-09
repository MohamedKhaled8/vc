import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/controller/requriment_controller.dart';
import 'package:vc/controller/service_form_controller.dart';
import 'package:vc/helper/caching_data.dart';
import 'package:vc/model/auth/login_model.dart';
import 'package:vc/model/requirement_model.dart';
import 'package:vc/view/samples/samples_screen.dart';
import 'package:vc/view/service_form/extra_service_btn.dart';
import 'package:vc/view/service_form/othe_room.dart';
import 'package:vc/view/service_form/widget_date_time.dart';
import 'package:vc/widgets/container_shadow.dart';
import 'package:vc/widgets/custom_app_bar.dart';
import 'package:vc/widgets/custom_text_next_button.dart';
import 'package:vc/view/service_form/slider.dart';
import '../../controller/user_home_controller.dart';
import '../../model/services_model/user_home_model.dart';
import '../../theme/constant/const_colors.dart';
import 'package:flutter/material.dart';

class ServiceFormScreen extends StatefulWidget {
  final Service? serviceModel;

  const ServiceFormScreen({Key? key, required this.serviceModel})
      : super(key: key);

  @override
  State<ServiceFormScreen> createState() => _ServiceFormScreenState();
}

class _ServiceFormScreenState extends State<ServiceFormScreen> {
  String? seclected;
  List<String> lang = [
    "95, Opposite Arjun College, Kairav Plot ",
    "20, Mansoura , ElAbbasey"
  ];

  final ServiceFormController serviceController =
  Get.put(ServiceFormController());
  final RequrimentController requrimentController =
  Get.put(RequrimentController());
  final UserHomeController extraServiceController =
  Get.put(UserHomeController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    Size size = MediaQuery
        .of(context)
        .size;
    final Map orderData = {};
    List _extraServiceList = [];
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.85),
      body: Column(
        children: [
          SizedBox(
            height: size.height - 69.5,
            child: ListView(
              // padding: EdgeInsets.only(top: 10,bottom: 20),
              children: [
                CustomAppbar(
                  image: setImage(),
                  serviceName: widget.serviceModel!.title!,
                  rating: widget.serviceModel!.rate!.toDouble(),
                ),
                GetBuilder<ServiceFormController>(
                  builder: (_) {
                    return Container(
                      padding:
                      const EdgeInsets.only(right: 20, left: 20, top: 10),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: screenUtil.setHeight(800),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Work area',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(10),
                          ),
                          const SlideView(),
                          SizedBox(
                            height: screenUtil.setHeight(8),
                          ),
                          const Text(
                            'Date and Time',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(15),
                          ),
                          PickDateTime(),
                          SizedBox(
                            height: screenUtil.setHeight(25),
                          ),
                          const Text(
                            'Address',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(15),
                          ),
                          Container(
                            height: screenUtil.setHeight(55),
                            width: size.width,
                            decoration: buildShadowContainer(
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: screenUtil.setWidth(50),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorApp.primary,
                                    image: const DecorationImage(
                                        image:
                                        AssetImage('assets/icons/c3.png')),
                                  ),
                                ),
                                SizedBox(
                                  width: screenUtil.setWidth(10),
                                ),
                                FutureBuilder(
                                    future: CachingData.cachingLoginData(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData &&
                                          snapshot.connectionState ==
                                              ConnectionState.done) {
                                        final userProfileData =
                                        snapshot.data as LoginModel;
                                        return Expanded(
                                          child: DropdownButton(
                                              isExpanded: true,
                                              icon: const Icon(
                                                  Icons.arrow_drop_down),
                                              dropdownColor: Colors.white,
                                              underline: const SizedBox(),
                                              hint:
                                              const Text('Select Address'),
                                              value: seclected,
                                              items: userProfileData
                                                  .userData.address
                                                  .map((e) {
                                                return DropdownMenuItem(
                                                    value: e, child: Text(e));
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  seclected = value as String?;
                                                });
                                              }),
                                        );
                                      } else {
                                        return const SizedBox();
                                      }
                                    }),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(20),
                          ),
                          const Text(
                            'Repeat',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(10),
                          ),
                          MultiSelectContainer(
                              highlightColor: ColorApp.buttonBlue,
                              splashColor: ColorApp.buttonBlue,
                              itemsDecoration: MultiSelectDecorations(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0x33000000),
                                        offset: Offset(0, 0),
                                        blurRadius: 8,
                                        spreadRadius: 0)
                                  ],
                                ),
                                selectedDecoration: BoxDecoration(
                                    color: ColorApp.primary,
                                    borderRadius: BorderRadius.circular(5)),
                                disabledDecoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              items: extraServiceList,
                              onChange: (allSelectedItems, selectedItem){}),

                          SizedBox(
                            height: screenUtil.setHeight(20),
                          ),
                          const Text(
                            'Extra Service',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(10),
                          ),
                          MultiSelectContainer(
                            highlightColor: ColorApp.buttonBlue,
                            splashColor: ColorApp.buttonBlue,
                              itemsDecoration: MultiSelectDecorations(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0x33000000),
                                        offset: Offset(0, 0),
                                        blurRadius: 8,
                                        spreadRadius: 0)
                                  ],
                                ),
                                selectedDecoration: BoxDecoration(
                                    color: ColorApp.primary,
                                    borderRadius: BorderRadius.circular(5)),
                                disabledDecoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              items: extraServiceList,
                              onChange: (allSelectedItems, selectedItem){}),

                          /*
                                                    FutureBuilder(
                            future: extraServiceController.subService(
                                context: context,
                                id: widget.serviceModel!.id.toString()),
                            builder: ((context, snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.connectionState ==
                                      ConnectionState.done) {
                                final SubServiceModel extraSubServiceModel =
                                    snapshot.data as SubServiceModel;
                                return SizedBox(
                                  height: 100,
                                  child: GridView.builder(
                                    scrollDirection: Axis.horizontal,
                                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: extraSubServiceModel.data!.length,

                                    ),
                                    itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        _.selectExtraService(
                                            btnName: extraSubServiceModel
                                                .data![index].title);
                                      },
                                      child: ServiceBtn(
                                          isSelected: _.extraService[
                                              extraSubServiceModel
                                                  .data![index].title]!,
                                          title: extraSubServiceModel
                                              .data![index].title),
                                    ),
                                  ),
                                );
                              } else {
                                return const SizedBox();
                              }
                            }),
                          ),

                           */
                          //   Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     GetBuilder<ServiceFormController>(
                          //         init: ServiceFormController(),
                          //         builder: (_) {
                          //           return InkWell(
                          //             onTap: () {
                          //               _.selectExtraService(
                          //                   btnName: 'Cooking( 20\$ )');
                          //             },
                          //             child: ServiceBtn(
                          //                 isSelected: _
                          //                     .extraService['Cooking( 20\$ )']!,
                          //                 title: 'Cooking( 20\$ )'),
                          //           );
                          //         }),
                          //     GetBuilder<ServiceFormController>(builder: (_) {
                          //       return InkWell(
                          //           onTap: () {
                          //             _.selectExtraService(
                          //                 btnName: 'Once( 15\$ )');
                          //           },
                          //           child: ServiceBtn(
                          //               isSelected:
                          //               _.extraService['Once( 15\$ )']!,
                          //               title: 'Once( 15\$ )'));
                          //     }),
                          //     GetBuilder<ServiceFormController>(builder: (_) {
                          //       return InkWell(
                          //           onTap: () {
                          //             _.selectExtraService(
                          //                 btnName: 'Cooking( 16\$ )');
                          //           },
                          //           child: ServiceBtn(
                          //               isSelected:
                          //               _.extraService['Cooking( 16\$ )']!,
                          //               title: 'Cooking( 16\$ )'));
                          //     }),
                          //   ],
                          // ),
                          SizedBox(
                            height: screenUtil.setHeight(20),
                          ),

                          SizedBox(
                            height: screenUtil.setHeight(20),
                          ),
                          const Text(
                            'Other',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(10),
                          ),
                          Expanded(
                            child: FutureBuilder(
                                future: requrimentController.requirement(
                                    context: context,
                                    id: widget.serviceModel!.id.toString()),
                                builder: ((context, snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot.connectionState ==
                                          ConnectionState.done) {
                                    final RequriementModel requirmentModel =
                                    snapshot.data as RequriementModel;
                                    return ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            height: screenUtil.setHeight(10),
                                          ),
                                      itemCount: requirmentModel.data!.length,
                                      itemBuilder: (context, index) =>
                                          BuildOtherItems(
                                            price: requirmentModel
                                                .data![index].requirementPrice,
                                            roomName:
                                            requirmentModel.data![index].title +
                                                ' ',
                                            roomPrice:
                                            '(${'${requirmentModel.data![0]
                                                .requirementPrice}\$'})',
                                            btnNum: 3,
                                          ),
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                })),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          GetBuilder<ServiceFormController>(
            builder: (_) =>
                CustomTextNextButton(
                    totalPrice:
                    '${_.roomTotalPrice + _.bathroomTotalPrice +
                        _.kitchenTotalPrice}',
                    onTap: () {
                      _.selectedExtraService.forEach((key, value) {
                        _extraServiceList.add(key);
                      });
                      Get.to(() =>
                          SamplesScreen(
                            orderData: {
                              'workArea': _.workArea!.end.toString(),
                              'orderDate': _.orderDate,
                              'orderTime': _.orderTime,
                              'address': seclected,
                              'repeatService': _.repeatService,
                              'extraService': _extraServiceList,
                              'totalPrice': _.roomTotalPrice +
                                  _.bathroomTotalPrice +
                                  _.kitchenTotalPrice,
                            },
                            serviceModel: widget.serviceModel!,
                          ));
                    }),
          ),
        ],
      ),
    );
  }

  dynamic setImage() {
    if (widget.serviceModel != null &&
        widget.serviceModel!.images != null &&
        widget.serviceModel!.images!.contains('http')) {
      return NetworkImage(widget.serviceModel!.images!);
    } else {
      return const AssetImage('assets/icons/cleaning 1.png');
    }
  }
}
final List<MultiSelectCard> extraServiceList = [
  MultiSelectCard(
    value: 'Baseball',
    child: const ExtraServiceBtn(
      text: 'Baseball',
    ),
  ),
  MultiSelectCard(
    value: 'Astronomy',
    child: const ExtraServiceBtn(
      text: 'Astronomy',
    ),
  ),
  MultiSelectCard(
    value: 'Archery',
    child: const ExtraServiceBtn(
      text: 'Archery',
    ),
  ),
  MultiSelectCard(
    value: 'Table tennis',
    child: const ExtraServiceBtn(
      text: 'Table tennis',
    ),
  ),
  MultiSelectCard(
    value: 'Painting',
    child: const ExtraServiceBtn(
      text: 'Painting',
    ),
  ),
];
final List<MultiSelectCard> repeatList = [
  MultiSelectCard(
    value: 'Once',
    child: const ExtraServiceBtn(
      text: 'Once',
    ),
  ),

];


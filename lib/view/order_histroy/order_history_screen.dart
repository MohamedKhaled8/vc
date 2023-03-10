import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/view/order_histroy/widgets/tab1.dart';
import 'package:vc/view/order_histroy/widgets/tab2.dart';
import 'package:vc/view/order_histroy/widgets/tab3.dart';

import 'package:vc/widgets/custom_appbar_two.dart';

import '../../theme/constant/const_colors.dart';

class OrderHistoryScreen extends StatefulWidget  {
 const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> with SingleTickerProviderStateMixin{
  final ScreenUtil screenUtil = ScreenUtil();
  TabController? tabController;
  @override
  void initState() {
    tabController =  TabController(length: 3, vsync: this);
    super.initState();
  }
  // @override
  // void dispose() {
  //   super.dispose();
  // }
  // @override
  // void didChangeDependencies() {
  //
  //  tabController;
  //
  //   super.didChangeDependencies();
  // }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
      return Scaffold(
        backgroundColor: Color(0xffF4F4F4),
      appBar: DefaultAppBar(110, text: 'Order History', onTap: () {}),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Scaffold(
            backgroundColor:Color(0xffF4F4F4),
            body: Column(
              children: [
                SizedBox(
                  height: screenUtil.setHeight(58.5),
                  child: AppBar(
                    backgroundColor:Color(0xffF4F4F4),
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    bottom: TabBar(
                      unselectedLabelColor: const Color(0xff00702D),
                      controller: tabController,
                      labelColor: ColorApp.primary,
                      indicatorColor: ColorApp.primary,
                      unselectedLabelStyle: const TextStyle(color: Color(0xff00702D),),
                      isScrollable: true,
                      tabs: [
                        Tab(
                            icon: Text(
                          'Current',
                          style: TextStyle(
                              color: ColorApp.primary, fontSize: 18),
                        )),
                        Tab(
                            icon: Text(
                          'Cancelled',
                          style: TextStyle(
                              color: ColorApp.primary, fontSize: 18),
                        )),
                        Tab(
                            icon: Text(
                          'Finished',
                          style: TextStyle(
                              color: ColorApp.primary, fontSize: 18),
                        )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Tab1Screen(),
                      Tab2Screen(),
                      Tab3Screen(),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

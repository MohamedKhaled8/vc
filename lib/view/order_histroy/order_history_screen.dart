import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vc/widgets/custom_appbar_two.dart';

import '../../theme/constant/const_colors.dart';

class OrderHistoryScreen extends StatelessWidget {
   OrderHistoryScreen({Key? key}) : super(key: key);
  final  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(110, text: 'Order History', onTap: () {}),
      body: Column(
        children: [
          SizedBox(
            height: screenUtil.setHeight(90),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  body: Column(
                    children: [
                      SizedBox(
                        height: 73,
                        child: AppBar(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          bottom: TabBar(
                            // controller: tabController,
                            labelColor: ColorApp.primary,
                            // padding: EdgeInsets.symmetric(horizontal: 30),
                            indicatorColor: ColorApp.primary,
                            isScrollable: true,
                            tabs: [
                              Tab(
                                icon:Text('Current',style: TextStyle(color: ColorApp.primary,fontSize: 18),)
                              ),
                              Tab(
                                  icon:Text('Cancelled',style: TextStyle(color: ColorApp.primary,fontSize: 18),)

                              ),
                              Tab(
                                  icon:Text('Finished',style: TextStyle(color: ColorApp.primary,fontSize: 18),)

                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

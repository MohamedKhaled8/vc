import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vc/model/orders/order_model.dart';

import '../../controller/order/order_controller.dart';

import '../../../widgets/custom_orders_container.dart';

class Tab1Screen extends StatelessWidget {
  Tab1Screen({Key? key}) : super(key: key);

  final ScreenUtil screenUtil = ScreenUtil();
  final OrderController getOrderController = OrderController();
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: getOrderController.getOrder(context: context),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final OrdersModel data = snapshot.data as OrdersModel;
            return Container(
              margin: const EdgeInsets.only(top: 220),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    if (index == data.data!.length - 1) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: CustomOrdersContainer(
                          screenUtil: screenUtil,
                          data: data.data![index],
                        ),
                      );
                    } else {
                      return CustomOrdersContainer(
                        screenUtil: screenUtil,
                        data: data.data![index],
                      );
                    }

                    // ignore: avoid_types_as_parameter_names
                  },
                  // ignore: avoid_types_as_parameter_names
                  separatorBuilder: (BuildContext cont, int) {
                    return SizedBox(
                      height: screenUtil.setHeight(20),
                    );
                  },
                  itemCount: data.data!.length),
            );
          } else {
            return const SizedBox();
          }
        }));
  }
}

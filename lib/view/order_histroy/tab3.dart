import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vc/controller/order/order_controller.dart';
import 'package:vc/model/orders/finished_order_model.dart';

import 'package:vc/widgets/custom_orders_container.dart';

import '../../../model/orders/order_model.dart';

class Tab3Screen extends StatelessWidget {
  Tab3Screen({Key? key}) : super(key: key);
  final ScreenUtil screenUtil = ScreenUtil();
  final OrderController finishOrderController = OrderController();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: finishOrderController.finishOrder(context: context),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final FinishedOrderModel data = snapshot.data as FinishedOrderModel;
            return Container(
              margin: const EdgeInsets.only(top: 220),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    if (index == data.finishedOrder!.length - 1) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: CustomOrdersContainer(
                          screenUtil: screenUtil,
                          data: data.finishedOrder![index],
                        ),
                      );
                    } else {
                      return CustomOrdersContainer(
                        screenUtil: screenUtil,
                        data: data.finishedOrder![index],
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
                  itemCount: data.finishedOrder!.length),
            );
          } else {
            return SizedBox();
          }
        }));
  }
}

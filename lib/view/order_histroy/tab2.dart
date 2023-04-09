import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vc/controller/order/order_controller.dart';
import 'package:vc/model/orders/show_cancel_order_model.dart';
import '../../widgets/custom_orders_container.dart';

class Tab2Screen extends StatelessWidget {
  final ScreenUtil screenUtil = ScreenUtil();
  final OrderController controller = OrderController();

  Tab2Screen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: controller.showCancellOrder(context: context),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final ShowCancelledOrderModel data =
                snapshot.data as ShowCancelledOrderModel;
            return Container(
              margin: const EdgeInsets.only(top: 220),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    if (index == data.cancelledOrder!.length - 1) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: CustomOrdersContainer(
                          screenUtil: screenUtil,
                          data: data.cancelledOrder![index],
                        ),
                      );
                    } else {
                      return CustomOrdersContainer(
                        screenUtil: screenUtil,
                        data: data.cancelledOrder![index],
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
                  itemCount: data.cancelledOrder!.length),
            );
          } else {
            return SizedBox();
          }
        }));
  }
}

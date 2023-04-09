// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vc/animation/animated_scale.dart';
import 'package:vc/controller/animation_controller.dart';
import 'package:vc/controller/payment_controller.dart';
import 'package:vc/model/payment/all_payment_mdel.dart';
import 'package:vc/view/payment/change_card_screen.dart';
import 'package:vc/widgets/credet_card.dart';

import '../../../model/services_model/user_home_model.dart';
import '../../../theme/constant/sized.dart';
import '../../../widgets/container_shadow.dart';
import '../../../widgets/custom_containert_top_screen.dart';

class TopStackAppBar extends StatelessWidget {
  final Widget? card;
  final Map PriceOrderCard;
  final Service serviceModel;
  const TopStackAppBar({
    Key? key,
    this.card,
    required this.PriceOrderCard,
    required this.serviceModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Inject = Get.put(Animation_Controller());
    final _paymentController = Get.put(PaymentController());
    final PaymentController _allpaymentController =
        Get.put(PaymentController());

    // ignore: no_leading_underscores_for_local_identifiers
    final Animation_Controller _controller = Get.find();
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: size.width,
          height: size.height / 2 - 120,
        ),
        CustomContainerTopScreen(
          ontap: () {
            Get.back();
          },
          screenUtil: screenUtil,
          text: 'Check Out',
          size: 150,
        ),
        FutureBuilder(
          future: _allpaymentController.allPayment(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              final allPaymentCards = snapshot.data as AllPaymentModel;
              return Positioned(
                top: 100,
                child: Column(
                  children: [
                    Container(
                      width: screenUtil.setWidth(350),
                      height: screenUtil.setHeight(120),
                      decoration: buildShadowContainer(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: GetBuilder<Animation_Controller>(
                        init: Animation_Controller(),
                        builder: (controller) => AnimatedScaleTapDown_Up(
                          initScale: _controller.scale,
                          onTapDownFunx: () =>
                              _controller.ScaleAnimation_TapDown_Up(
                                  maxScale: 1.15),
                          onTapUpFunx: () =>
                              _controller.ScaleAnimation_TapDown_Up(
                                  maxScale: 1.15),
                          child: InkWell(
                            onTapDown: (tap) {
                              _controller.ScaleAnimation_TapDown_Up(
                                  maxScale: 1.15);
                            },
                            onTapUp: (tap) {
                              _controller.ScaleAnimation_TapDown_Up(
                                  maxScale: 1.15);
                            },
                            child: card == null
                                ? CredetCard(
                                    paymentCard: allPaymentCards.data![0],
                                  )
                                : card,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(
                            ChangeCardScreen(
                              serviceModel: serviceModel,
                              PriceOrderCard: PriceOrderCard,
                              allPaymentModel: allPaymentCards,
                            ),
                            transition: Transition.zoom,
                            duration: const Duration(milliseconds: 1000));
                      },
                      child: Container(
                        height: screenUtil.setHeight(48),
                        width: screenUtil.setWidth(350),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Change Card',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}

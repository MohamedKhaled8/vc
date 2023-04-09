import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/animation/animated_scale.dart';
import 'package:vc/controller/animation_controller.dart';
import 'package:vc/model/model_card.dart';
import 'package:vc/model/services_model/user_home_model.dart';
import 'package:vc/widgets/Card_view.dart';

class OffersHomeBuilder extends StatelessWidget {
  final List<Announcement>? offers;

  const OffersHomeBuilder({
    super.key,
    this.offers,
  });

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(Animation_Controller());

    return PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        itemCount: offers!.length,
        itemBuilder: (context, index) {
          return GetBuilder<Animation_Controller>(
            init: Animation_Controller(),
            builder: (controller) {
              if (index >= offers!.length - 1 ||
                  _colorIndex >= _colors.length - 1) {
                _colorIndex = 0;
              } else {
                _colorIndex++;
              }
              return AnimatedScaleTapDown_Up(
                initScale: _controller.scale,
                animationSpeed: const Duration(seconds: 1),
                child: InkWell(
                  onTapDown: (details) {
                    controller.ScaleAnimation_TapDown_Up(maxScale: 1.05);
                  },
                  onTapUp: (details) {
                    controller.ScaleAnimation_TapDown_Up(maxScale: 1);
                  },
                  child: CardView(
                    backgroundColor: _colors[_colorIndex],
                    modelCard: ModelCard(
                      title: offers![index].title,
                      image: offers![index].photo,
                      id: offers![index].id,
                    ),
                  ),
                ),
                onTapDownFunx: () => controller.ScaleAnimation_TapDown_Up(),
                onTapUpFunx: () => controller.ScaleAnimation_TapDown_Up(),
              );
            },
          );
        });
  }
}

int _colorIndex = -1;
List<Color> _colors = [
  Color(0xff90369E),
  Color(0xff369E85),
];

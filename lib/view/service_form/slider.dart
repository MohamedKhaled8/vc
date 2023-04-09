import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/controller/service_form_controller.dart';

import '../../theme/constant/const_colors.dart';

class SlideView extends StatefulWidget {
  const SlideView({Key? key}) : super(key: key);

  @override
  State<SlideView> createState() => _SlideViewState();
}

class _SlideViewState extends State<SlideView> {
  RangeValues _currentRangeValue = const RangeValues(20, 80);
  @override
  Widget build(BuildContext context) {
    final _serviceController = Get.put(ServiceFormController());
    _serviceController.workArea = _currentRangeValue;
    return RangeSlider(
        activeColor: ColorApp.primary,
        inactiveColor: ColorApp.primary.withOpacity(0.2),
        labels: RangeLabels(_currentRangeValue.start.round().toString(),
            _currentRangeValue.end.round().toString()),
        values: _currentRangeValue,
        max: 250,
        min: 1,
        divisions: 100,
        onChanged: (RangeValues values) {
          _serviceController.workArea = values;
          setState(() {
            _currentRangeValue = values;
          });
        });
  }
}

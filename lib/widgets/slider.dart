import 'package:flutter/material.dart';
import 'package:flutter_multi_slider/flutter_multi_slider.dart';

class SliderView extends StatefulWidget {
const SliderView({Key? key}) : super(key: key);

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  List<double> m2 = [0.1, 0.2];
  final chartTextFont = const TextStyle(fontSize: 16);

  bool m2Enable = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SchedualSlider(
            weekDay: 'Work area',
            values: m2,
            onChanged: (value) => setState(() => m2 = value),
            enabled: m2Enable,
            onToggle: (value) => setState(() => m2Enable = value),
          ),
        ),
      ],
    );
  }
}
class SchedualSlider extends StatelessWidget {
  const SchedualSlider({
    required this.values,
    required this.weekDay,
    required this.onChanged,
    required this.onToggle,
    required this.enabled,
    Key? key,
  }) : super(key: key);
  final List<double> values;
  final String weekDay;
  final ValueChanged<List<double>> onChanged;
  final ValueChanged<bool> onToggle;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    final chartTextFont =  TextStyle(fontSize: 16);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MultiSlider(
          color: const Color(0xff038A39),
          height: 15,
          values: values,
          onChanged: enabled ? onChanged : null,
          valueRangePainterCallback: (range) => range.index % 2 == 1,
          divisions: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('0m2', style: chartTextFont),
              Text('10m2', style: chartTextFont),
              Text('20m2', style: chartTextFont),
              Text('30m2', style: chartTextFont),
              Text('40m2', style: chartTextFont),
            ],
          ),
        ),
      ],
    );
  }
}

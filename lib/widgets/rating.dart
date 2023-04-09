import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/constant/const_colors.dart';

class CustomRating extends StatefulWidget {
  final bool enabled;
  final double size;
  final double initialRating;
  final int serviceID;
  final Color textColor;

  CustomRating({
    super.key,
    required this.size,
    this.enabled = true,
    required this.initialRating,
    required this.serviceID,
    required this.textColor,
  });
  @override
  State<CustomRating> createState() => _CustomRatingState();
}

class _CustomRatingState extends State<CustomRating> {
  IconData? selectedIcon;

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RatingBar.builder(
          ignoreGestures: widget.enabled,
          itemSize: widget.size,
          initialRating: double.parse(widget.initialRating.toStringAsFixed(2)),
          unratedColor: ColorApp.starFalse,
          allowHalfRating: true,
          itemCount: 5,
          itemBuilder: (context, _) => Icon(
            selectedIcon ?? Icons.star,
            color: ColorApp.starTrue,
          ),
          onRatingUpdate: (rating) {
            // setState(() {
            //   ratingCount = rating;
            // });
          },
          updateOnDrag: true,
        ),
        SizedBox(
          width: screenUtil.setWidth(5),
        ),
        Text(
          widget.initialRating.toString(),
          style: TextStyle(
            color: widget.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            height: 1.2,
          ),
        )
      ],
    );
  }
}

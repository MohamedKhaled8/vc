import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vc/theme/extensions/extensions.dart';

import '../theme/constant/const_colors.dart';

class CustomRating extends StatefulWidget {
   const CustomRating({Key? key}) : super(key: key);

  @override
  State<CustomRating> createState() => _CustomRatingState();
}

class _CustomRatingState extends State<CustomRating> {
  double? ratingCount;
  double initialRating = 0.0;
  IconData? selectedIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBar.builder(
          itemSize: 20,
          initialRating: initialRating,
          unratedColor: ColorApp.starFalse,
          allowHalfRating: true,
          itemCount: 5,
          itemBuilder: (context, _) => Icon(
            selectedIcon ?? Icons.star,
            color: ColorApp.starTrue,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              ratingCount = rating;
            });
          },
          updateOnDrag: true,
        ), 5.pw,
        Text(
          'Rating: ${ratingCount??0}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );

  }
}

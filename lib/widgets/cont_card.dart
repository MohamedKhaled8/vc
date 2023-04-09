import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/model/services_model/user_home_model.dart';

import '../view/service_name/service_name_screen.dart';

class ContCard extends StatelessWidget {
  final List<Categories>? categories;
  final bool shimmer;
  const ContCard({
    super.key,
    required this.screenUtil,
    this.categories,
    required this.shimmer,
  });

  final ScreenUtil screenUtil;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenUtil.setHeight(140),
      width: screenUtil.screenWidth,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories!.length,
        itemBuilder: (context, index) {
          if (index >= categories!.length - 1 ||
              _colorIndex >= _colors.length - 1) {
            _colorIndex = 0;
          } else {
            _colorIndex++;
          }
          return Container(
            height: screenUtil.setHeight(140),
            width: screenUtil.setWidth(100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: _colors[_colorIndex],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                setImage(index: index) != null
                    ? Container(
                        height: screenUtil.setHeight(105),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image(
                            image: setImage(index: index),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : SizedBox(
                        height: screenUtil.setHeight(115),
                      ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      !shimmer ? categories![index].title : '',
                      style: const TextStyle(fontSize: 14),
                    )),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: screenUtil.setWidth(15),
        ),
      ),
    );
  }

  dynamic setImage({required int index}) {
    if (categories![index].images != null &&
        categories![index].images.contains('http')) {
      return NetworkImage(categories![index].images);
    }
  }
}

int _colorIndex = -1;
List<Color> _colors = [
  Color(0xff00952A).withOpacity(0.3),
  Color(0xffD73679).withOpacity(0.3),
  Color(0xff1D7C71).withOpacity(0.3),
  Color(0xffEF8100).withOpacity(0.3),
];

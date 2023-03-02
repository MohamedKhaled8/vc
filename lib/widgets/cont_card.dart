import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContCard extends StatelessWidget {
  const ContCard({
    super.key,
    required this.screenUtil,
  });

  final ScreenUtil screenUtil;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: screenUtil.setHeight(140),
                width: screenUtil.setWidth(80),
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(
                      "assets/icons/Vector.png",
                    )),
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff00952A)
                        .withOpacity(0.3)),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("companys", style: TextStyle(fontSize: 14),)),
                ),
              ),
            ],
          ),
           SizedBox(
            width: screenUtil.setWidth(10),
          ),
          Container(
            height: screenUtil.setHeight(140),
            width: screenUtil.setWidth(90),
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                  "assets/icons/houses.png",
                )),
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffD73679)
                    .withOpacity(0.3)),
            child: const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("houses", style: TextStyle(fontSize: 14),)),
            ),
          ),
         SizedBox(
            width: screenUtil.setWidth(10),
          ),
          Container(
            height: screenUtil.setHeight(140),
            width: screenUtil.setWidth(90),
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                  "assets/icons/vehicles.png",
                )),
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff1D7C71)
                    .withOpacity(0.3)),
            child: const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("vehicles", style: TextStyle(fontSize: 14),)),
            ),
          ),
          SizedBox(
            width: screenUtil.setWidth(10),
          ),
          Container(
            height: screenUtil.setHeight(140),
            width: screenUtil.setWidth(80),
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                  "assets/icons/party.png",
                )),
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffEF8100)
                    .withOpacity(0.3)),
            child: const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("Party", style: TextStyle(fontSize: 14),)),
            ),
          ),
         SizedBox(
            width: screenUtil.setWidth(10),
          ),
          Container(
            height: screenUtil.setHeight(140),
            width: screenUtil.setWidth(90),
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                  "assets/icons/vehicles.png",
                )),
                borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff1D7C71)
                    .withOpacity(0.3)),
            child: const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("vehicles", style: TextStyle(fontSize: 14),)),
            ),
          ),
         SizedBox(
            width: screenUtil.setWidth(10),
          ),
          Container(
            height: screenUtil.setHeight(140),
            width: screenUtil.setWidth(90),
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                  "assets/icons/Vector.png",
                )),
                borderRadius: BorderRadius.circular(10),
              color: const Color(0xff00952A)
                        .withOpacity(0.3)),
            child: const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("companys" , style: TextStyle(fontSize: 14),)),
            ),
          ),
         
        ],
      ),
    );
  }
}

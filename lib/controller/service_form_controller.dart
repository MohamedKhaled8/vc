import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/constant/const_colors.dart';

class ServiceFormController extends GetxController{
  List<Map<String, dynamic>> cats = [
    {'title': 'Once', 'isSelected': true},
    {'title': 'Weekly', 'isSelected': false},
    {'title': 'Monthly', 'isSelected': false},
  ];
  List<Map<String, dynamic>> service1 = [
    {'title': 'Cooking', 'isSelected': false},
    {'title': 'Once', 'isSelected': true},
    {'title': 'washing & Cooking', 'isSelected': false},
  ];
  List<Map<String, dynamic>> service2 = [
    {'title': 'Window', 'isSelected':true },
    {'title': 'dish washing', 'isSelected':false },
    {'title': 'Cooking', 'isSelected': false},
  ];
  int currentCat = 0;
  int currentService1 = 0;
  int currentService2 = 0;

  Widget cartItem1(String text,BuildContext context,{required int index}) {
    return InkWell(
      onTap: () {
          cats[currentCat]['isSelected'] = false;
          currentCat = index;
          cats[currentCat]['isSelected'] = true;
          update();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        height: 40,
        decoration: BoxDecoration(
          color: cats[index]['isSelected']
              ? ColorApp.primary
              : Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow:  const [
            BoxShadow(
                color: Color(0x33000000),
                offset: Offset(0, 0),
                blurRadius: 8,
                spreadRadius: 0)
          ],
        ),
        child: Center(
          child: Text(
            cats[index]['title'],
            style:cats[index]['isSelected']? TextStyle(color: Colors.white, fontSize: 14): TextStyle(color: ColorApp.primary, fontSize: 14),
          ),
        ),
      ),
    );
  }
  Widget cartItem2(String text,BuildContext context,{required int index}) {
    return InkWell(
      onTap: () {
          service1[currentService1]['isSelected'] = false;
          currentService1 = index;
          service1[currentService1]['isSelected'] = true;
          update();
      },
      child: Container(
        width:MediaQuery.of(context).size.width / 4,
        height: 40,
        decoration: BoxDecoration(
          color: service1[index]['isSelected']
              ? ColorApp.primary
              : Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow:  const [
            BoxShadow(
                color: Color(0x33000000),
                offset: Offset(0, 0),
                blurRadius: 8,
                spreadRadius: 0)
          ],
        ),
        child: Center(
          child: Text(
            service1[index]['title'],
            style:service1[index]['isSelected']? TextStyle(color: Colors.white, fontSize: 14): TextStyle(color: ColorApp.primary, fontSize: 14),
          ),
        ),
      ),
    );
  }
  Widget cartItem3(String text,BuildContext context,{required int index}) {
    return InkWell(
      onTap: () {
          service2[currentService2]['isSelected'] = false;
          currentService2 = index;
          service2[currentService2]['isSelected'] = true;
          update();
      },
      child: Container(
        width: MediaQuery.of(context).size.width  / 4,
        height: 40,
        decoration: BoxDecoration(
          color: service2[index]['isSelected']
              ? ColorApp.primary
              : Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow:  const [
            BoxShadow(
                color: Color(0x33000000),
                offset: Offset(0, 0),
                blurRadius: 8,
                spreadRadius: 0)
          ],
        ),
        child: Center(
          child: Text(
            service2[index]['title'],
            style:service2[index]['isSelected']? TextStyle(color: Colors.white, fontSize: 14): TextStyle(color: ColorApp.primary, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
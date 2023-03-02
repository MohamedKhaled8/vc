import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

 final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController addressCont = TextEditingController();
  final TextEditingController phonrCont = TextEditingController();
 


  var isPasswordHidden = true.obs;
  bool isCheckBox = false;
var counter = 0.obs;

   void isCheckBoxx () {
    isCheckBox = !isCheckBox;
    update();
   }

 



}
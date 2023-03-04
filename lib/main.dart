import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/view/payment/add_payment_card.dart';
import 'package:vc/view/payment/change_card_screen.dart';
import 'package:vc/view/payment/order_details_screen.dart';
import 'package:vc/view/service_form/service_form_screen.dart';
main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  //  Cachdata.cachInitialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(393, 852),
        builder: (context, child) {
          return   GetMaterialApp(
            title: 'Value Cleaning',
            debugShowCheckedModeBanner: false,
            home: ServiceFormScreen(),
          );
        });
  }
}

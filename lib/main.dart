import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/view/home_view/bottom_nav_bar.dart';
import 'package:vc/view/home_view/chat_view.dart';
import 'package:vc/view/home_view/detailes_screen_view.dart';
import 'package:vc/view/home_view/home.dart';

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
            home: DetailsView(),
          );
        });
  }
}

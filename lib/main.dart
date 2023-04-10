import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/helper/check_internet.dart';
import 'package:vc/helper/secure_storage.dart';
import 'package:vc/view/frist_splash_view/frist_splash_screen.dart';
import 'package:vc/view/messages/views/chat_view.dart';
import 'helper/db_sh.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Shared_Preference.init();
  await Secure_Storage.init();
  await check_Internet();
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
        return  GetMaterialApp(
          title: 'Value Cleaning',
          debugShowCheckedModeBanner: false,
          home: ChatView(),
        );
      },
    );
  }
}

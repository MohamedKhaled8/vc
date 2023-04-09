import 'package:get/get.dart';
import 'package:vc/controller/authentication_controller/auth_controller.dart';

import '../../controller/myController.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => MyController());
  }
}

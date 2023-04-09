import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  bool credit = true;
  bool recepit = false;

  selectPatmentType({required String type}) {
    if (type == 'credit') {
      credit = true;
      recepit = false;
    } else if (type == 'recepit') {
      credit = false;
      recepit = true;
    }
    update();
  }
}

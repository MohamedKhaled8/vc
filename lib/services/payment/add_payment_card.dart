import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class AddPaymentCardService {
  Future<dynamic> addPaymentCard(
      {required Map<String, dynamic> body, required String token}) async {
    final data = await ApiService().post(
      url: EndPointName.ADDPAYMENTCARD,
      body: body,
      token: token,
    );
    return data;
  }
}

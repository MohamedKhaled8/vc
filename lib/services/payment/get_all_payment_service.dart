import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class GetAllPaymentService {
  Future<dynamic> getAllPayment({required String token}) async {
    final data = await ApiService().get(
      url: EndPointName.ALLPAYMENT,
      token: token,
    );
    return data;
  }
}

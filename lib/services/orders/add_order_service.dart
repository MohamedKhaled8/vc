import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class AddOrderService {
  AddOrderService();
  Future<dynamic> addOrder({
    Map<String, dynamic>? body,
    String? lang,
    required String token,
  }) async {
    final data = await ApiService().post(
      url: EndPointName.CREATEORDER,
      body: body,
      token: token,
    );
    return data;
  }
}


import 'package:vc/helper/end_points.dart';

import '../../helper/api.dart';

class GetOrderService {
  Future<dynamic> getOrder({required String token}) async {
    final data = await ApiService().get(
      url: EndPointName.ORDER,
      token: token,
    );
    return data;
  }
}
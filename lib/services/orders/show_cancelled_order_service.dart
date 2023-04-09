
import 'package:vc/helper/end_points.dart';

import '../../helper/api.dart';

class ShowCancelledOrderService {
  Future<dynamic> showCancelledOrder({required String token}) async {
    final data = await ApiService().get(
      url: EndPointName.SHOWCANCELLEDORDER,
      token: token,
    );
    return data;
  }
}
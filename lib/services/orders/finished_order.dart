
import 'package:vc/helper/end_points.dart';

import '../../helper/api.dart';

class FinishedOrderService {
  Future<dynamic> finishedOrder({required String token}) async {
    final data = await ApiService().get(
      url: EndPointName.FINISHEDDORDER,
      token: token,
    );
    return data;
  }
}
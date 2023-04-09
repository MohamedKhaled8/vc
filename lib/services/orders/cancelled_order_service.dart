
import 'package:vc/helper/end_points.dart';

import '../../helper/api.dart';

class CancelledOrderService {
  Future<dynamic>cancelledOrder({required String token,int? id}) async {
    final data = await ApiService().get(
      url: '${EndPointName.CANCELEDORDER}$id',
      token: token,
    );
    return data;
  }
}
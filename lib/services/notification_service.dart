import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class NotificationService {
  Future<dynamic> notification({required String token,required String url}) async {
    final data =
        await ApiService().get(url: url, token: token);
    return data;
  }
}

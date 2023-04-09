import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class LogoutService {
  Future<dynamic> logout({required String token}) async {
    final data = await ApiService().get(
      url: EndPointName.LOGOUT,
    );
    return data;
  }
}

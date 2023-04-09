import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class UserHomeService {
  Future<dynamic> getUserHome({required String token}) async {
    final data = await ApiService().get(
      url: EndPointName.USERHOME,
      token: token,
    );
    return data;
  }
}

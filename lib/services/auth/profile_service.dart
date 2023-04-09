import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class ProfileService {
  Future<dynamic> profile({required String token}) async {
    final data = await ApiService().get(
      url: EndPointName.PROFILE,
      token: token,
    );
    return data;
  }
}

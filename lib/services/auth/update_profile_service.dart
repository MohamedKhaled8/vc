import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class UpdateProfileService {
  Future<dynamic> updateProfile({
    required Map body,
    required String token,
  }) async {
    final data = await ApiService()
        .post(url: EndPointName.UPDATEPROFILE, body: body, token: token);
    return data;
  }
}

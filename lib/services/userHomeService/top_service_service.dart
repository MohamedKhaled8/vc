import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class TopService {
  Future<dynamic> topService({required String token}) async {
    final data = await ApiService().get(
      url: EndPointName.TOPSERVICE,
      token: token,
    );
    return data;
  }
}

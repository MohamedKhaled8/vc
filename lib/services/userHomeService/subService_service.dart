import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class SubService {
  Future<dynamic> subService({required String id,required String token,}) async {
    final data = await ApiService().get(
      url: EndPointName.SUBSERVICE+id,
      token: token,
    );
    return data;
  }
}


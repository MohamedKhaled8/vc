import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class RequriementService {
  Future<dynamic> requiremnt({required String id,required String token}) async {
    final data = await ApiService().get(
      url: EndPointName.REQUIREMENT+id,
      token: token
    );
    return data;
  }
}

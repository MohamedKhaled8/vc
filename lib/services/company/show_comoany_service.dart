import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class ShowCompanyService {
  Future<dynamic> showCompany({required int id,required String token}) async {
    final data = await ApiService().get(
      url: EndPointName.SHOWCOMPANY+id.toString(),
      token: token,
    );
    return data;
  }
  Future<dynamic> allCompany({required String token}) async {
    final data = await ApiService().get(
      url: EndPointName.ALLCOMPANY,
      token: token,
    );
    return data;
  }
}

import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class CompanyRegisterService {
  Future<dynamic> companyRegister({required Map body}) async {
    final data = await ApiService().post(
      url: EndPointName.REGISTERCOMPANY,
      body: body,
    );
    return data;
  }
}

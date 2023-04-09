import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class LoginService {
  LoginService();

  Future<dynamic> login({required Map body}) async {
    final data = await ApiService().post(
      url: EndPointName.LOGIN,
      body: body,
    );
    return data;
  }
}

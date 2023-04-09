import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';
import 'package:http/http.dart' as http;

class ForgetPasswordService {
  Future<dynamic> forgetPassword({
    required Map body,
  }) async {
    final data = await ApiService().post(
      url: EndPointName.FORGETPASSWORD,
      body: body,
    );
    return data;
  }
}

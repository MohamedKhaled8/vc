import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class ChangePasswordService {
  Future<dynamic> changePassword({required Map body}) async {
    final data = await ApiService().post(
      url: EndPointName.CHANGEPASSWORD,
      body: body,
    );
    return data;
  }
}

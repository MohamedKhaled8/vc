import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class DeleteAccountService {
  Future<dynamic> deleteAccount(
      {required String token}) async {
    final data = await ApiService().delete(
      url: EndPointName.DELETEACCOUNT,
      token: token,
    );
    return data;
  }
}

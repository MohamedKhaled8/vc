import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class CodeConfirmService {
  CodeConfirmService();
  Future<dynamic> codeConfirm({required Map body}) async {
    final data = await ApiService().post(
      url: EndPointName.CHECKCODE,
      body: body,
    );
    return data;
  }
}

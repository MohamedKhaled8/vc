import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';


class SendMessageService {
  Future<dynamic> sendMessage(
      {
        required String token,
        required Map<String, dynamic> body
      }
      ) async {
    final data = await ApiService().multiPartR(

      url: EndPointName.SENDMESSAGE,
      body: body,
      token: token,
    );
    return data;
  }
}
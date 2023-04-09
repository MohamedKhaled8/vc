import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';


class LatestMessageService {
  Future<dynamic> latestMessage(
      {
        required String token,
        required Map<String, dynamic> body
      }
      ) async {
    final data = await ApiService().post(
      url: EndPointName.LATESTMESSAGE,
      body: body,
      token: token,
    );
    return data;
  }
}
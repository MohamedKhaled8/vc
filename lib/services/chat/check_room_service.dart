import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';


class CheckRoomMessageService {
  Future<dynamic> checkRoom(
      {
        required String token,
        required Map<String, dynamic> body
      }
      ) async {
    final data = await ApiService().post(
      url: EndPointName.CHECKROOMMESSAGE,
      body: body,
      token: token,
    );
    return data;
  }
}
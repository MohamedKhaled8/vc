import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';


class GetRoomMessageService {
  Future<dynamic> getRoomMessage(
      {
        required String token,
        required Map<String, dynamic> body
      }
      ) async {
    final data = await ApiService().post(
      url: EndPointName.ROOMMESSAGE,
      body: body,
      token: token,
    );
    return data;
  }
}
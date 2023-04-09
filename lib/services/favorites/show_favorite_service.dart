import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class ShowFavoriteService {
  Future<dynamic> showFavorite(
      {required int favId, required String token}) async {
    final data = await ApiService().get(
      url: '${EndPointName.SHOWFAVORITE}$favId',
      token: token,
    );
    return data;
  }
}

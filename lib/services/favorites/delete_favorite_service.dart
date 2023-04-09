import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class DeleteFavoriteService {
  Future<dynamic> deleteFavorite(
      {required String token, required String id}) async {
    final data = await ApiService().delete(
      url: EndPointName.DELETEFAVORITE + id,
      token: token,
    );
    return data;
  }
}

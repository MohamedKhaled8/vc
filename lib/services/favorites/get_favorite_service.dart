import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class GetFavoriteService {
  Future<dynamic> getFavorite() async {
    final data = await ApiService().get(
      url: EndPointName.FAVORITE,
    );
    return data;
  }
}

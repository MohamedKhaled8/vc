import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class UpdateReviewService {
  Future<dynamic> updateReview({
    required int id,
    required Map<String, dynamic> body,
    required String token,
    required String url,
  }) async {
    final data = await ApiService().post(
      url: url+id.toString(),
      body: body,
      token: token,
    );
    return data;
  }
}
import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';
import 'package:vc/model/review/create_review_model.dart';

class AddReviewService {
  Future<dynamic> addReview(
      {required String lang,
        required String token,
        required String url,
        required Map<String, dynamic> body}) async {
    final data = await ApiService().post(
      url: url,
      body: body,
      token: token,
    );
    return data;
  }
}
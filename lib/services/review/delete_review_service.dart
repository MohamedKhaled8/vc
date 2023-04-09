
import '../../helper/api.dart';

class DeleteReviewService {
  Future<dynamic> deleteReview(
      {required int id,required String url, required String token,}) async {
    final data = await ApiService().delete(
      url: url+id.toString(),
      token: token,
    );
    return data;
  }
}


import '../../helper/api.dart';

class GetReviewService {
  Future<dynamic> getReview({required String token,required String url,}) async {
    final data = await ApiService().get(
      url: url,
      token: token,
    );
    return data;
  }
}

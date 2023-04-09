import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class JobsDoneService {
  Future<dynamic> jobsDone({required String id,required String token}) async {
    final data = await ApiService().get(
        url: EndPointName.JOBSDONE+id,
        token: token
    );
    return data;
  }
}
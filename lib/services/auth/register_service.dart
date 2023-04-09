import 'package:vc/helper/api.dart';
import 'package:vc/helper/end_points.dart';

class RegisterService {
  final Map body;

  RegisterService({
    required this.body,
  });

  Future<dynamic> register() async {
    final data = await ApiService().post(
      url: EndPointName.REGISTER,
      body: body,
    );
    return data;
  }
}

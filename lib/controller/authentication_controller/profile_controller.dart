import 'package:get/get.dart';
import 'package:vc/model/auth/profile_model.dart';
import 'package:vc/services/auth/profile_service.dart';

import '../../helper/caching_data.dart';

class ProfileController extends GetxController {
  Future<ProfileModel> profile() async {
    final token = await CachingData.cachingLoginData();

    final data = await ProfileService().profile(token: token.token);
    return ProfileModel.fromJson(data);
  }
}

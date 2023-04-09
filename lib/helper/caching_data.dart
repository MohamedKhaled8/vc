import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:vc/helper/db_sh.dart';
import 'package:vc/helper/secure_storage.dart';
import 'package:vc/model/auth/login_model.dart';
import 'package:vc/model/services_model/user_home_model.dart';

class CachingData {

  static Future<LoginModel> cachingLoginData() async {
     loginData = LoginModel.fromJson(
        jsonDecode(await Secure_Storage.getData(key: 'userLoginData')));
    return loginData;
  }

  static Future<UserHomeModel?> cachingUserHomeData() async {
    final userHomeData = UserHomeModel.fromJson(
        jsonDecode(await Secure_Storage.getData(key: 'userHomeData')));
    return userHomeData;
  }

  static Future getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      } else {
        if (await Geolocator.isLocationServiceEnabled()) {
          location = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);
          await Shared_Preference.setData(
              key: 'userLocation', value: jsonEncode(location));
        }
      }
    } else {
      location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }
  }

  static Position? location;
}
 late LoginModel loginData;

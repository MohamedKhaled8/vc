import 'package:shared_preferences/shared_preferences.dart';

class Shared_Preference {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  //methods

  //1-setData
  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      await sharedPreferences!.setInt(key, value);
      return true;
    }
    if (value is String) {
      await sharedPreferences!.setString(key, value);
      return true;
    }
    if (value is bool) {
      await sharedPreferences!.setBool(key, value);
      return true;
    }
    if (value is double) {
      await sharedPreferences!.setDouble(key, value);
      return true;
    }
    return false;
  }

  //2-getData
  static dynamic getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  //3-remove /deleteData
  static void deleteData({required String key}) {
    sharedPreferences!.remove(key);
  }

  //4-clear
  static void clearData({required String key}) {
    sharedPreferences!.clear();
  }
}

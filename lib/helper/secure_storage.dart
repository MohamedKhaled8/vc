import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Secure_Storage {
  static FlutterSecureStorage? secureStorage;

  static init() async {
    secureStorage = const FlutterSecureStorage();
  }
  //methods

  //1-setData
  static setData({required String key, required String value}) async {
    await secureStorage!.write(key: key, value: value);
  }

  //2-getData
  static dynamic getData({required String key}) async {
    return await secureStorage!.read(key: key);
  }

  //3-remove /deleteData
  static deleteData({required String key}) async {
    await secureStorage!.delete(key: key);
  }

  //4-clear
  static clearData() async {
    await secureStorage!.deleteAll();
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class cacheHelper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static String? getString({required String key}) {
    return sharedPreferences.getString(key);
  }

  static Future<bool> setString(
      {required String key, required String value}) async {
    return await sharedPreferences.setString(key, value);
  }

  static Future<bool> removeData({
    required String key,
  }) {
    return sharedPreferences.remove(key);
  }
}

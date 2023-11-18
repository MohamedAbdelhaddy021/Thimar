import 'package:shared_preferences/shared_preferences.dart';

import '../../views/auth/login/model.dart';

class CacheHelper {
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveUserDetail(UserModel model) async {
    await _prefs.setString("fullname", model.fullname);
    await _prefs.setString("phone", model.phone);
    await _prefs.setString("email", model.email);
    await _prefs.setString("image", model.image);
    await _prefs.setBool("isActive", model.isActive);
    await _prefs.setString("token", model.token);
  }
  static String getUserToken(){
    return _prefs.getString("token")??"";
  }

  static bool isAuth() {
    String? token = _prefs.getString("token");

    return token != null || (token ?? "").isNotEmpty;
  }

  static Future<bool> clear() async {
    return await _prefs.clear();
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Preferences._();

  static late final SharedPreferences _pref;

  static Future<void> initializeApp() async =>
      _pref = await SharedPreferences.getInstance();

  static bool getBool(String key) => _pref.getBool(key) ?? false;
  static void setBool(String key, bool value) => _pref.setBool(key, value);
}

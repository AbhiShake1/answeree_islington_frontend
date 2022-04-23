import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences _pref;

Future<void> initializeApp() async => _pref = await SharedPreferences.getInstance();

bool getBool(String key) => _pref.getBool(key) ?? false;
void setBool(String key, bool value) => _pref.setBool(key, value);

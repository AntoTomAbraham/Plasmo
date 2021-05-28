import 'package:shared_preferences/shared_preferences.dart';

class Userpreferances {
  static SharedPreferences _preferences;
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
  static Future setUsername(String name) async {
    await _preferences.setString("name", name);
  }

  static String getUsername(String string) => _preferences.getString(string);
}

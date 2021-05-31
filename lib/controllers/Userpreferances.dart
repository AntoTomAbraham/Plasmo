import 'package:shared_preferences/shared_preferences.dart';

class Userpreferances {
  static const _keyemail = 'name';
  static SharedPreferences _preferences;
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
  static Future setemail(String name) async {
    await _preferences.setString(_keyemail, name);
  }

  static String getemail(String string) => _preferences.getString(_keyemail);
}

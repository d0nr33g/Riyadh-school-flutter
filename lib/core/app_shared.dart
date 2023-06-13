import 'package:shared_preferences/shared_preferences.dart';

class AppShared {
  static String sharedPreferenceTokenKey = "Token";
  static String lang = 'Lang';

  static late String token = "";
  static late String language = "";
  static Future<void> setToken(String userToken) async {
    AppShared.token = userToken;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(sharedPreferenceTokenKey, userToken);
  }

  static Future getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? result = prefs.getString(sharedPreferenceTokenKey);
    print(result);
    if (result != null) token = result;
    return result;
  }

  static Future<void> logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(sharedPreferenceTokenKey);
    prefs.remove(lang);
  }
  static Future<void> setLanguage(String _lang) async {
    AppShared.language = _lang;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(lang, _lang);
  }

  static Future<void> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? result = prefs.getString(lang);
    print(result);
    if (result != null) language = result;
  }
}


import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constant.dart';

class LocalPreference {

  static String selectedLanguageKey = "language";
  static String selectedThemeKey = "theme";
  static SharedPreferences? _prefs;

  static Future<SharedPreferences?> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  //save selected language
  static Future saveSelectedLanguage(value) async {
    await _prefs?.setString(selectedLanguageKey, value);
  }

  //get selected language
  static String? getSelectedLanguage() {
    return _prefs?.getString(selectedLanguageKey);
  }

  //save selected theme
  static Future saveSelectedTheme(value) async {
    await _prefs?.setBool(selectedThemeKey, value);
  }

  //get selected theme
  static bool? getSelectedTheme(){
    return _prefs?.getBool(selectedThemeKey);
  }

  //clear and remove preferences
  static Future<bool?> remove(String key) async => await _prefs?.remove(key);
  static Future<bool?> clear() async => await _prefs?.clear();

}
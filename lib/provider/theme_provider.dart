import 'package:setin/storage/LocalPreference.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {

  bool _darkTheme = false;

  bool get darkTheme => darkTheme;

  set darkTheme(bool value){
    _darkTheme = value;
    LocalPreference.saveSelectedTheme(value);
    notifyListeners();
  }

}
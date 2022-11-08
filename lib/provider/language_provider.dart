import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:setin/model/language.dart';
import '../utils/constant.dart';
import 'package:setin/storage/LocalPreference.dart';

class LanguageProvider extends ChangeNotifier{

  final List<Language> _languages = [
    Language(id: 1, name: Strings.arabic, isSelected: false),
    Language(id: 2, name: Strings.english, isSelected: false),
    Language(id: 3, name: Strings.french, isSelected: false),
    Language(id: 4, name: Strings.german, isSelected: false),
    Language(id: 5, name: Strings.hindi, isSelected: false),
    Language(id: 6, name: Strings.spanish, isSelected: false)
  ];

 UnmodifiableListView<Language> get allLanguage {
   return UnmodifiableListView(_languages);
   notifyListeners();
 }

 void setSelectedLanguage(Language language) async {
   language.languageSelected();
   await LocalPreference.saveSelectedLanguage(language.name);
 }

}
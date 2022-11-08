import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setin/provider/language_provider.dart';
import 'package:setin/storage/LocalPreference.dart';

import '../model/language.dart';
import '../utils/constant.dart';


class DisplayLanguage extends StatefulWidget {

  final Language languages;

  const DisplayLanguage({Key? key, required this.languages}) : super(key: key);

  @override
  State<DisplayLanguage> createState() => _DisplayLanguageState();

}

class _DisplayLanguageState extends State<DisplayLanguage> {

  String? selectedLanguage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var languageProvider = Provider.of<LanguageProvider>(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Consumer<LanguageProvider>(
            builder: (context, model, child){
              return InkWell(
                onTap: () {
                  languageProvider.setSelectedLanguage(widget.languages);
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Text(
                      widget.languages.name,
                    ),
                    SizedBox(width: 20),
                    if(widget.languages.name == LocalPreference.getSelectedLanguage())
                      Image.asset(
                        Images.checkMark,
                        color: isDarkMode ? Colors.white : Colors.black,
                        height: 14,
                        width: 14,
                      ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

}
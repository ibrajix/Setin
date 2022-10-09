import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setin/model/language_provider.dart';
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
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Consumer<LanguageProvider>(
            builder: (context, model, child){
              return InkWell(
                onTap: () {
                  setSelectedLanguage(widget.languages.name);
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Text(
                      widget.languages.name,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void setSelectedLanguage(String name) async {
    await LocalPreference.saveSelectedLanguage(name);
  }

}
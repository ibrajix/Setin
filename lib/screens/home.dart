import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:minimize_app/minimize_app.dart';
import 'dart:io' show Platform;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:setin/storage/LocalPreference.dart';
import 'package:setin/theme/colors.dart';
import 'package:setin/utils/constant.dart';
import 'package:setin/screens/notifications.dart';

import '../widgets/language_item.dart';
import 'package:setin/provider/language_provider.dart';


class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}



class _HomeState extends State<Home> {

  String? _selectedLanguage;

  void getSelectedLanguage() {
    setState(()  {
      _selectedLanguage =
          LocalPreference.getSelectedLanguage();
    });
  }

  @override
  void initState() {
    super.initState();
    getSelectedLanguage();
  }

  @override
  Widget build(BuildContext context) {

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    var languages = Provider.of<LanguageProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 20),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap:() {
                _onBackClicked();
              },
              child: Image.asset(
                Images.arrowLeft,
                color: isDarkMode ? Colors.white : Colors.black,
                height: 26,
                width: 26,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Text(
                  Strings.settings,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600
                  ),
                )
            ),
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: const Text(
                Strings.account,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: InkWell(
                onTap: () {
                  context.push(Destination.accountPath);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration:  BoxDecoration(
                        color: Theme.of(context).colorScheme.customGreyBg,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: Image.asset(
                          Images.userProfile,
                          color: Theme.of(context).colorScheme.customContentInGreyBg,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Text(
                            Strings.ibrahim,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            Strings.personalInfo,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.customContentInGreyBg,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 50,
                      height: 50,
                      decoration:  BoxDecoration(
                        color: Theme.of(context).colorScheme.customGreyBg,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Padding(
                          padding: const EdgeInsets.all(13),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: isDarkMode ? Colors.white : Colors.black,
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: const Text(
                Strings.settings,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: InkWell(
                onTap: () {

                  //do something
                  Future future = showModalBottomSheet(context: context, builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 50, left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children:
                        languages.allLanguage.map((languages) => DisplayLanguage(languages: languages)).toList(),
                      ),
                    );
                  });

                  future.then((_) {
                    getSelectedLanguage();
                  });

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration:  BoxDecoration(
                        color: Theme.of(context).colorScheme.customBrownBg,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: Icon(
                            Icons.language,
                            color: Theme.of(context).colorScheme.customContentBrownBg,
                          )
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: const Text(
                        Strings.language,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Text(
                        _selectedLanguage?? Strings.hindi,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.customContentInGreyBg,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 50,
                      height: 50,
                      decoration:  BoxDecoration(
                        color: Theme.of(context).colorScheme.customGreyBg,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Padding(
                          padding: const EdgeInsets.all(13),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: isDarkMode ? Colors.white : Colors.black,
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: InkWell(
                onTap: () {
                  //go to notifications
                  context.push(Destination.notificationsPath);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration:  BoxDecoration(
                        color: Theme.of(context).colorScheme.customBlueBg,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: Icon(
                            Icons.notifications,
                            color: Theme.of(context).colorScheme.customContentBlueBg,
                          )
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: const Text(
                        Strings.notifications,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 50,
                      height: 50,
                      decoration:  BoxDecoration(
                        color: Theme.of(context).colorScheme.customGreyBg,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Padding(
                          padding: const EdgeInsets.all(13),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: isDarkMode ? Colors.white : Colors.black,
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: InkWell(
                onTap: () {
                  //go to notifications

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration:  BoxDecoration(
                        color: Theme.of(context).colorScheme.customPurpleBg,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: Icon(
                            Icons.dark_mode,
                            color: Theme.of(context).colorScheme.customContentPurpleBg,
                          )
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: const Text(
                        Strings.darkMode,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 50,
                      height: 50,
                      child:  Padding(
                          padding: const EdgeInsets.all(13),
                          child: Switch(
                            value: LocalPreference.getSelectedTheme() ?? false,
                            onChanged: (value){
                              setState(() {
                                //change switch state
                                LocalPreference.saveSelectedTheme(value);
                              });
                            },
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onBackClicked(){
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      MinimizeApp.minimizeApp();
    }
  }

}
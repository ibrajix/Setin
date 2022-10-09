import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setin/storage/LocalPreference.dart';
import 'package:setin/theme/app_theme.dart';
import 'package:setin/theme/bloc/theme_bloc.dart';

class Settings extends StatelessWidget {



  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView.builder(itemCount: AppTheme.values.length, itemBuilder: (context, index) {

          final singleTheme = AppTheme.values[index];

          return InkWell(
            onTap: () {
              BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(theme: singleTheme));
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                color: appThemeData[singleTheme]?.primaryColor
              ),
              child:  Center(
                child: Text(
                    singleTheme.toString(),
                    style: appThemeData[singleTheme]?.textTheme.bodyText2,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

}
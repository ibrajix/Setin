
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:setin/provider/language_provider.dart';
import 'package:setin/navigation/routes.dart';
import 'package:setin/storage/LocalPreference.dart';
import 'package:setin/theme/bloc/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalPreference.init();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

    MyApp({Key? key}) : super(key: key);
   final _router = MyRouter().router;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        routeInformationProvider: _router.routeInformationProvider,
      ),
    );
  }
}
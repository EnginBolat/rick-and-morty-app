import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_and_morty_app/constants/const_colors.dart';
import 'package:rick_and_morty_app/pages/home_page.dart';

import 'constants/const_text.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialazion(null);
  runApp(const MyApp());
}

Future initialazion(BuildContext? context) async {
  //You will be add your resources.For load in splash screen
  await Future.delayed(const Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ConstTexts.appName,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            color: ConstColors.darkGreen,
          ),
          textTheme: const TextTheme(
            headline6: TextStyle(),
          )),
      home: const HomePage(),
    );
  }
}

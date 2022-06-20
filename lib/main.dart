import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_and_morty_app/pages/home_page.dart';

import 'constants/const_text.dart';

void main() {
  runApp(const MyApp());
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
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      home: const HomePage(),
    );
  }
}

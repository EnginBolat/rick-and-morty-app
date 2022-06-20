import 'package:flutter/material.dart';
import 'package:rick_and_morty_demo/pages/fetch_data_test.dart';
import 'package:rick_and_morty_demo/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RickAndMorty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const MyWidget(),
    );
  }
}


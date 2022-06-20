import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/constants/const_text.dart';

import '../models/character.dart';
import 'dart:convert';

import '../widget/character_showcase.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  List<Character> characters = <Character>[];
  bool loading = false;
  int _currentPage = 1;

  void getCharacters() async {
    http.Response response = await http.get(Uri.parse(
        'https://rickandmortyapi.com/api/character?page=$_currentPage'));

    Map<String, dynamic> map = await jsonDecode(response.body);
    List<dynamic> data = map['results'];
    if (kDebugMode) {
      print(data);
    }

    setState(() {
      _currentPage++;
      for (var i = 0; i < data.length; i++) {
        Character char = Character();
        char.id = data[i]['id'];
        char.name = data[i]['name'];
        char.status = data[i]['status'];
        char.species = data[i]['species'];
        char.type = data[i]['type'];
        char.gender = data[i]['gender'];
        char.location = data[i]['location'];
        char.origin = data[i]['origin'];
        char.image = data[i]['image'];
        loading = true;
        characters.add(char);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCharacters();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        if (kDebugMode) {
          print("New Data");
        }
        getCharacters();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(ConstTexts.homePageAppBarTitle),
      ),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
        ),
        controller: _scrollController,
        itemCount: characters.length,
        itemBuilder: ((context, index) {
          var character = characters[index];
          return CharacterShowCaseWidget(character: character);
        }),
      ),
    );
  }
}

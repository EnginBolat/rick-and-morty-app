import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rick_and_morty_demo/models/character_model.dart';
import 'package:rick_and_morty_demo/services/services.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Services services = Services();
  int currentPage = 1;
  List<Result> characters = [];
  late int totalPages;

  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  Future<bool> getCharacterData([isRefresh = false]) async {
    if (isRefresh) currentPage = 1;
    final Uri uri = Uri.parse(
        "https://rickandmortyapi.com/api/character?page=$currentPage]");

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final result = heroModelFromJson(response.body);
      characters = result.results;
      currentPage++;
      totalPages=result.info.pages;
      print(response.body);
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    getCharacterData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: refresh()
      // refresh(),
    );
  }

  SmartRefresher refresh() {
    return SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      onLoading: () async {
        final result = getCharacterData(true);
        // ignore: unrelated_type_equality_checks
        if (result == true) {
          refreshController.loadComplete();
        } else {
          refreshController.loadFailed();
        }
      },
      onRefresh: () async {
        final result = getCharacterData(true);
        // ignore: unrelated_type_equality_checks
        if (result == true) {
          refreshController.refreshCompleted();
        } else {
          refreshController.refreshFailed();
        }
      },
      child: ListView.separated(
        itemBuilder: ((context, index) {
          final character = characters[index];

          return ListTile(
            title: Text(character.name),
            subtitle: Text(character.location.name),
            trailing: Text(character.gender),
          );
        }),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: characters.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CharacterDetailsListTile extends StatelessWidget {
  const CharacterDetailsListTile(
      {Key? key, required this.title, required this.trailing})
      : super(key: key);

  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
      ),
      trailing: Text(trailing),
    );
  }
}

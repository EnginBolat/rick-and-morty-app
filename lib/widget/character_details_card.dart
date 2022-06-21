import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:rick_and_morty_app/constants/const_text.dart';
import 'package:rick_and_morty_app/widget/character_details_listtile.dart';

import 'custom_glass_container.dart';

class CharacterDetailsCard extends StatelessWidget {
  const CharacterDetailsCard(
      {Key? key,
      required this.status,
      required this.species,
      required this.gender,
      required this.originName,
      required this.locationName,
      required this.padding})
      : super(key: key);

  final String? status;
  final String? species;
  final String? gender;
  final String? originName;
  final String? locationName;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return CustomGlassContainer(
      padding: padding,
      height: 350.0,
      widtht: double.infinity,
      borderRadius: 20.0,
      blur: 20.0,
      border: 2.0,
      widgetColumm: Column(children: [
        CharacterDetailsListTile(
          title: ConstTexts.status,
          trailing: status ?? "Null",
        ),
        const Divider(),
        CharacterDetailsListTile(
          title: ConstTexts.species,
          trailing: species ?? "Null",
        ),
        const Divider(),
        CharacterDetailsListTile(
          title: ConstTexts.gender,
          trailing: gender ?? "Null",
        ),
        const Divider(),
        CharacterDetailsListTile(
          title: ConstTexts.originName,
          trailing: originName ?? "Null",
        ),
        const Divider(),
        CharacterDetailsListTile(
          title: ConstTexts.locationName,
          trailing: locationName ?? "Null",
        ),
      ]),
    );
  }
}

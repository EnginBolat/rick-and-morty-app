import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/widget/character_details_card.dart';
import 'package:rick_and_morty_app/widget/custom_scaffold_color.dart';

import '../widget/hero_image.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({
    Key? key,
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.originName,
    required this.locationName,
    required this.image,
  }) : super(key: key);
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final String? originName;
  final String? locationName;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldColor(
      widgetScaffold: Scaffold(
        appBar: AppBar(
          title: Text(name ?? "Null"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeroImage(
                image: image,
                bottomLeftRadius: 20.0,
                bottomRightRadius: 20.0,
                padding: 10.0,
              ),
              CharacterDetailsCard(
                status: status,
                species: species,
                gender: gender,
                originName: originName,
                locationName: locationName,
                padding: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

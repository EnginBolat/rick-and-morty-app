import 'package:flutter/material.dart';

import '../models/character.dart';
import '../pages/character_detail_page.dart';

class CharacterShowCaseWidget extends StatelessWidget {
  const CharacterShowCaseWidget({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CharacterDetails(
                      id: character.id,
                      name: character.name,
                      status: character.status,
                      species: character.species,
                      type: character.type,
                      gender: character.gender,
                      originName: character.origin!['name'],
                      locationName: character.location!['name'],
                      image: character.image,
                    )));
      },
      child: SizedBox(
        width: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: SizedBox(
                      height: 170,
                      width: 170,
                      child: Image.network('${character.image}',
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    character.name!.length > 20
                        ? Text(character.name!.substring(0, 20)+"...")
                        : Text(character.name!)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

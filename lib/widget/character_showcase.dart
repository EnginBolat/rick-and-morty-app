import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/constants/const_colors.dart';

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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child:
                        Image.network('${character.image}', fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: 160,
                child: Card(
                  color: ConstColors.lightYellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      character.name!.length > 15
                          ? Text(
                              character.name!.substring(0, 15) + "...",
                              style: Theme.of(context).textTheme.subtitle1!,
                            )
                          : Text(
                              character.name!,
                              style: Theme.of(context).textTheme.subtitle1!,
                            )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

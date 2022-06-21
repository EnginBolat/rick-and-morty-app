import 'package:flutter/material.dart';

import '../constants/const_colors.dart';


class CustomScaffoldColor extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CustomScaffoldColor({required this.widgetScaffold});

final Scaffold widgetScaffold;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              ConstColors.lightBlue,
              ConstColors.darkGreen,
            ],
            begin: const FractionalOffset(0.5, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp),
    ),
    child: widgetScaffold,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:rick_and_morty_app/constants/const_colors.dart';

class CustomGlassContainer extends StatelessWidget {
  const CustomGlassContainer(
      {Key? key,
      required this.widgetColumm,
      required this.padding,
      required this.height,
      required this.widtht,
      required this.borderRadius,
      required this.blur,
      required this.border})
      : super(key: key);

  final double padding;
  final double height;
  final double widtht;
  final double borderRadius;
  final double blur;
  final double border;
  final Column widgetColumm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: GlassmorphicContainer(
        width: widtht,
        height: height,
        borderRadius: borderRadius,
        blur: blur,
        alignment: Alignment.bottomCenter,
        border: border,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ConstColors.glassContainerColorOppacity01,
              ConstColors.glassContainerColorOppacity05,
            ],
            stops: const [
              0.1,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ConstColors.glassContainerColorWhite05,
            ConstColors.glassContainerColorWhite05,
          ],
        ),
        child: widgetColumm,
      ),
    );
  }
}

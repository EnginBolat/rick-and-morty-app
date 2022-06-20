import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  const HeroImage(
      {Key? key,
      required this.image,
      required this.bottomLeftRadius,
      required this.bottomRightRadius,
      required this.padding})
      : super(key: key);

  final String? image;
  final double bottomLeftRadius;
  final double bottomRightRadius;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bottomLeftRadius),
            bottomRight: Radius.circular(bottomRightRadius),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Image.network(
              "$image",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

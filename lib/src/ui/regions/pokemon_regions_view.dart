import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:global66/src/widgets/image_with_description.dart';

class PokemonRegions extends StatelessWidget {
  const PokemonRegions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ImageWithDescription(
            context: context,
            image: Image.asset(
              'assets/images/utils/jiggly.png',
              scale: 0.2,
              fit: BoxFit.contain,
              width: 200,
            ),
            title: FlutterI18n.translate(context, "regions.title"),
            description: FlutterI18n.translate(context, "regions.description"),
            topRatio: 0.20,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:global66/src/constants/font_size.dart';
import 'package:global66/src/models/pokemon_model.dart';
import 'package:global66/src/widgets/enum_values.dart';

class OvalType extends StatelessWidget {
  const OvalType({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 3,
      runSpacing: 4,
      children:
          pokemon.details!.types.map((pokemonType) {
            var pokemonTypeColor = getPokemonTypeColor(pokemonType.name)[0];
            var pokemonTypeIcon = getPokemonTypeIcon(pokemonType.name);
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: pokemonTypeColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(25),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Image.asset(
                        scale: 1,
                        width: 15,
                        pokemonTypeIcon,
                        color: pokemonTypeColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    FlutterI18n.translate(
                      context,
                      "pokemon_types.${pokemonType.name}",
                    ),
                    style: TextStyle(
                      fontSize: kPokemonNumber,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}

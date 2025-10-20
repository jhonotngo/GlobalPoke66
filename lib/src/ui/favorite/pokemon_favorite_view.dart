import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global66/src/providers/favorite/favorites_pokemon_provider.dart';
import 'package:global66/src/widgets/enum_values.dart';
import 'package:global66/src/widgets/image_with_description.dart';
import 'package:global66/src/widgets/pokemon_info_card.dart';

class PokemonFavorites extends ConsumerWidget {
  const PokemonFavorites({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritePokemons = ref.watch(favoritesPokemonProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          FlutterI18n.translate(context, "favorites.title"),
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
      ),
      body:
          favoritePokemons.isEmpty
              ? SafeArea(
                child: Center(
                  child: ImageWithDescription(
                    context: context,
                    image: Image.asset(
                      'assets/images/utils/magikarp.png',
                      scale: 0.2,
                      fit: BoxFit.contain,
                      width: 200,
                    ),
                    title: FlutterI18n.translate(
                      context,
                      "favorites.no_favorites",
                    ),
                    description: FlutterI18n.translate(
                      context,
                      "favorites.add_favorites",
                    ),
                    topRatio: 0.17,
                  ),
                ),
              )
              : SafeArea(
                child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: favoritePokemons.length,
                  itemBuilder: (context, index) {
                    final pokemon = favoritePokemons[index];
                    final backgroundColor = getPokemonTypeColor(
                      pokemon.details!.types.first.name,
                    );

                    return Dismissible(
                      key: UniqueKey(), // Provide a unique key for each item
                      direction:
                          DismissDirection
                              .endToStart, // Allow swiping from right to left
                      onDismissed: (direction) {
                        ref
                            .read(favoritesPokemonProvider.notifier)
                            .toggleFavorite(pokemon);
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Image.asset(
                            'assets/images/utils/delete.png',
                            scale: 0.2,
                            fit: BoxFit.contain,
                            width: 55,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: PokemonInfoCard(
                        backgroundColor: backgroundColor,
                        pokemon: pokemon,
                      ),
                    );
                  },
                ),
              ),
    );
  }
}

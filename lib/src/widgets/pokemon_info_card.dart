import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global66/src/constants/color.dart';
import 'package:global66/src/constants/font_size.dart';
import 'package:global66/src/models/pokemon_model.dart';
import 'package:global66/src/providers/favorite/favorites_pokemon_provider.dart';
import 'package:global66/src/ui/pokedex/pokemon_detail_view.dart';
import 'package:global66/src/widgets/enum_values.dart';
import 'package:global66/src/widgets/oval_type.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class PokemonInfoCard extends StatelessWidget {
  const PokemonInfoCard({
    super.key,
    required this.backgroundColor,
    required this.pokemon,
  });

  final List<Color> backgroundColor;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      height: MediaQuery.of(context).size.height * 0.13,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [backgroundColor[1], backgroundColor[1]],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: PokemonDetailV(pokemon: pokemon),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      // Left side - Info
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Nº${pokemon.id.padLeft(3, '0')}',
                                      style: TextStyle(
                                        fontSize: kPokemonNumber,
                                        fontWeight: FontWeight.w600,
                                        color: kPokemonNumberBlack,
                                      ),
                                    ),

                                    Text(
                                      pokemon.name[0].toUpperCase() +
                                          pokemon.name
                                              .substring(1)
                                              .toLowerCase(),
                                      style: TextStyle(
                                        fontSize: kPokemonName,
                                        fontWeight: FontWeight.w600,
                                        color: kPokemonNameBlack,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: OvalType(pokemon: pokemon),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Right side - Pokemon Image
                      Container(
                        decoration: BoxDecoration(
                          color: backgroundColor[0],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ShaderMask(
                              shaderCallback:
                                  (bounds) => LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.white.withValues(alpha: 0.7),
                                      Colors.white.withValues(alpha: 0.5),
                                      Colors.white.withValues(alpha: 0.1),
                                    ],
                                  ).createShader(bounds),
                              blendMode: BlendMode.dstIn,
                              child: Image.asset(
                                scale: 0.5,
                                getPokemonTypeIcon(
                                  pokemon.details!.types.first.name,
                                ),
                              ),
                            ),
                            CachedNetworkImage(
                              imageUrl: pokemon.imageUrl,
                              height: 100,
                              errorWidget:
                                  (context, url, error) => Icon(
                                    Icons.catching_pokemon,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Favorite button
                Positioned(
                  top: 8,
                  right: 8,
                  child: Consumer(
                    builder: (context, ref, child) {
                      final favorites = ref.watch(favoritesPokemonProvider);
                      final isFavorite = favorites.any(
                        (poke) => poke.id == pokemon.id,
                      );
                      return Builder(
                        builder: (context) {
                          return InkWell(
                            onTap: () {
                              ref
                                  .read(favoritesPokemonProvider.notifier)
                                  .toggleFavorite(pokemon);
                            },
                            child: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(25),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                (isFavorite
                                    ? 'assets/images/utils/heartYes.png'
                                    : 'assets/images/utils/heartNo.png'),
                                scale: 0.2,
                                fit: BoxFit.contain,
                                width: 200,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

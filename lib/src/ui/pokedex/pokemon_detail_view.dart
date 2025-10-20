import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global66/src/constants/color.dart';
import 'package:global66/src/constants/font_size.dart';
import 'package:global66/src/models/pokemon_model.dart';
import 'package:global66/src/providers/favorite/favorites_pokemon_provider.dart';
import 'package:global66/src/widgets/enum_values.dart';
import 'package:global66/src/widgets/oval_type.dart';

class PokemonDetailV extends ConsumerWidget {
  const PokemonDetailV({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritePokemons = ref.watch(favoritesPokemonProvider);
    final isFavorite = favoritePokemons.any((poke) => poke.id == pokemon.id);

    final backgroundColor = getPokemonTypeColor(
      pokemon.details!.types.first.name,
    );

    final icon = getPokemonTypeIcon(pokemon.details!.types.first.name);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top colored section
          Stack(
            children: [
              Positioned(
                top: -180,
                right: 1,
                left: 1,
                child: CustomPaint(
                  size: Size(800, 400), // Define the size of the canvas
                  painter: BigCirclePainter(color: backgroundColor[0]),
                ),
              ),
            ],
          ),
          SafeArea(
            child: Column(
              children: [
                // Top bar with back button and favorite
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      InkWell(
                        onTap: () {
                          ref
                              .read(favoritesPokemonProvider.notifier)
                              .toggleFavorite(pokemon);
                        },
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      child: ShaderMask(
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
                        child: Image.asset(scale: 0.3, icon),
                      ),
                    ),
                    Hero(
                      tag: 'pokemon_${pokemon.id}',
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Image.network(
                          pokemon.imageUrl,
                          height: 300,
                          fit: BoxFit.fitHeight,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.catching_pokemon,
                              size: 220,
                              color: Colors.white,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // pokemon info
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Pokemon name
                    Text(
                      pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    Text(
                      'Nº${pokemon.id.padLeft(3, '0')}',
                      style: TextStyle(
                        fontSize: kPokemonNumberDetail,
                        fontWeight: FontWeight.w600,
                        color: kPokemonNumberBlack,
                      ),
                    ),

                    OvalType(pokemon: pokemon),
                    const SizedBox(height: 24),
                    // Stats section
                    Text(
                      FlutterI18n.translate(
                        context,
                        'pokemon_detail.base_stats',
                      ),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildStatBar(
                      FlutterI18n.translate(context, 'pokemon_detail.hp'),
                      pokemon.details!.stats.hp,
                      backgroundColor[0],
                    ),
                    _buildStatBar(
                      FlutterI18n.translate(context, 'pokemon_detail.attack'),
                      pokemon.details!.stats.attack,
                      backgroundColor[0],
                    ),
                    _buildStatBar(
                      FlutterI18n.translate(context, 'pokemon_detail.defense'),
                      pokemon.details!.stats.defense,
                      backgroundColor[0],
                    ),
                    _buildStatBar(
                      FlutterI18n.translate(
                        context,
                        'pokemon_detail.sp_attack',
                      ),
                      pokemon.details!.stats.specialAttack,
                      backgroundColor[0],
                    ),
                    _buildStatBar(
                      FlutterI18n.translate(
                        context,
                        'pokemon_detail.sp_defense',
                      ),
                      pokemon.details!.stats.specialDefense,
                      backgroundColor[0],
                    ),
                    _buildStatBar(
                      FlutterI18n.translate(context, 'pokemon_detail.speed'),

                      pokemon.details!.stats.speed,
                      backgroundColor[0],
                    ),
                    const SizedBox(height: 24),
                    // Physical attributes
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoCard(
                            context,
                            FlutterI18n.translate(
                              context,
                              'pokemon_detail.height',
                            ),
                            '${(pokemon.details!.height / 10).toStringAsFixed(1)} m',
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildInfoCard(
                            context,
                            FlutterI18n.translate(
                              context,
                              'pokemon_detail.weight',
                            ),
                            '${(pokemon.details!.weight / 10).toStringAsFixed(1)} kg',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            FlutterI18n.translate(
                              context,
                              'pokemon_detail.abilities',
                            ),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                              pokemon.details!.abilities.map((ability) {
                                return Expanded(
                                  child: _buildInfoCard(
                                    context,
                                    '',
                                    ability.name[0].toUpperCase() +
                                        ability.name.substring(1),
                                  ),
                                );
                              }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatBar(String label, int value, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 35,
            child: Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: (value / 200).clamp(0.0, 1.0),
                  child: Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.40,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black.withValues(alpha: 0.3)),
          ),
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BigCirclePainter extends CustomPainter {
  const BigCirclePainter({required this.color});

  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color =
              color // Or any color you prefer
          ..style = PaintingStyle.fill; // Use .stroke for an outline

    // Calculate the center of the canvas
    final center = Offset(size.width / 2, size.height / 2);

    // Define a large radius for the circle
    final radius = size.width * 0.7; // Example: 40% of the screen width

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Only repaint if properties change
  }
}

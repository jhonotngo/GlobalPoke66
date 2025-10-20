import 'package:flutter/foundation.dart';
import 'package:global66/src/models/pokemon_detail_model.dart';
import 'package:global66/src/models/pokemon_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

part 'favorites_pokemon_provider.g.dart';

@riverpod
class FavoritesPokemon extends _$FavoritesPokemon {
  static const String _favoritesKey = 'favorites';

  @override
  List<Pokemon> build() {
    _loadFavorites();
    return [];
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getString(_favoritesKey);

    if (favoritesJson != null) {
      try {
        final List<dynamic> decoded = json.decode(favoritesJson);
        final favorites = decoded.map((item) => _pokemonFromMap(item)).toList();
        state = favorites;
      } catch (e) {
        if (kDebugMode) {
          print('Error loading favorites: $e');
        }
        state = [];
      }
    }
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesData =
        state.map((pokemon) => _pokemonToMap(pokemon)).toList();
    final favoritesJson = json.encode(favoritesData);
    await prefs.setString(_favoritesKey, favoritesJson);
  }

  Map<String, dynamic> _pokemonToMap(Pokemon pokemon) {
    return {
      'name': pokemon.name,
      'url': pokemon.url,
      'details':
          pokemon.details != null
              ? {
                'id': pokemon.details!.id,
                'name': pokemon.details!.name,
                'height': pokemon.details!.height,
                'weight': pokemon.details!.weight,
                'imageUrl': pokemon.details!.imageUrl,
                'types':
                    pokemon.details!.types
                        .map((t) => {'name': t.name})
                        .toList(),
                'abilities':
                    pokemon.details!.abilities
                        .map((a) => {'name': a.name})
                        .toList(),
                'stats': {
                  'hp': pokemon.details!.stats.hp,
                  'attack': pokemon.details!.stats.attack,
                  'defense': pokemon.details!.stats.defense,
                  'specialAttack': pokemon.details!.stats.specialAttack,
                  'specialDefense': pokemon.details!.stats.specialDefense,
                  'speed': pokemon.details!.stats.speed,
                },
              }
              : null,
    };
  }

  Pokemon _pokemonFromMap(Map<String, dynamic> map) {
    PokemonDetail? details;
    if (map['details'] != null) {
      final detailsMap = map['details'];
      details = PokemonDetail(
        id: detailsMap['id'],
        name: detailsMap['name'],
        height: detailsMap['height'],
        weight: detailsMap['weight'],
        imageUrl: detailsMap['imageUrl'],
        types:
            (detailsMap['types'] as List)
                .map((t) => PokemonType(name: t['name']))
                .toList(),
        abilities:
            (detailsMap['abilities'] as List)
                .map((a) => PokemonAbility(name: a['name']))
                .toList(),
        stats: PokemonStats(
          hp: detailsMap['stats']['hp'],
          attack: detailsMap['stats']['attack'],
          defense: detailsMap['stats']['defense'],
          specialAttack: detailsMap['stats']['specialAttack'],
          specialDefense: detailsMap['stats']['specialDefense'],
          speed: detailsMap['stats']['speed'],
        ),
      );
    }

    return Pokemon(name: map['name'], url: map['url'], details: details);
  }

  Future<void> toggleFavorite(Pokemon pokemon) async {
    final isFav = state.any((poke) => poke.id == pokemon.id);
    if (isFav) {
      state = state.where((poke) => poke.id != pokemon.id).toList();
    } else {
      state = state + [pokemon];
    }
    await _saveFavorites();
  }

  bool isFavorite(String pokemonId) {
    return state.any((poke) => poke.id == pokemonId);
  }
}

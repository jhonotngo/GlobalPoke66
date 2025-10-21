import 'package:global66/src/models/pokemon_detail_model.dart';
import 'package:global66/src/models/pokemon_model.dart';

/// Fixtures para testing de Pokemon
class PokemonFixtures {
  /// Pokemon Detail de prueba - Pikachu
  static PokemonDetail get pikachuDetail => const PokemonDetail(
    id: 25,
    name: 'pikachu',
    height: 4,
    weight: 60,
    types: [PokemonType(name: 'electric')],
    abilities: [
      PokemonAbility(name: 'static'),
      PokemonAbility(name: 'lightning-rod'),
    ],
    stats: PokemonStats(
      hp: 35,
      attack: 55,
      defense: 40,
      specialAttack: 50,
      specialDefense: 50,
      speed: 90,
    ),
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png',
  );

  /// Pokemon Detail de prueba - Charizard
  static PokemonDetail get charizardDetail => const PokemonDetail(
    id: 6,
    name: 'charizard',
    height: 17,
    weight: 905,
    types: [PokemonType(name: 'fire'), PokemonType(name: 'flying')],
    abilities: [
      PokemonAbility(name: 'blaze'),
      PokemonAbility(name: 'solar-power'),
    ],
    stats: PokemonStats(
      hp: 78,
      attack: 84,
      defense: 78,
      specialAttack: 109,
      specialDefense: 85,
      speed: 100,
    ),
    imageUrl:
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png',
  );

  /// Pokemon básico con detalles
  static Pokemon get pikachuWithDetails => Pokemon(
    name: 'pikachu',
    url: 'https://pokeapi.co/api/v2/pokemon/25/',
    details: pikachuDetail,
  );

  /// Pokemon básico sin detalles
  static Pokemon get pikachuWithoutDetails => const Pokemon(
    name: 'pikachu',
    url: 'https://pokeapi.co/api/v2/pokemon/25/',
  );

  /// Pokemon básico - Bulbasaur
  static Pokemon get bulbasaur => const Pokemon(
    name: 'bulbasaur',
    url: 'https://pokeapi.co/api/v2/pokemon/1/',
  );

  /// Lista de Pokemon
  static List<Pokemon> get pokemonList => [
    pikachuWithDetails,
    Pokemon(
      name: 'charizard',
      url: 'https://pokeapi.co/api/v2/pokemon/6/',
      details: charizardDetail,
    ),
    bulbasaur,
  ];

  /// PokemonResponse de prueba
  static PokemonResponse get pokemonResponse => PokemonResponse(
    results: pokemonList,
    next: 'https://pokeapi.co/api/v2/pokemon?offset=20&limit=20',
    previous: null,
  );

  /// PokemonResponse vacío
  static const PokemonResponse emptyPokemonResponse = PokemonResponse(
    results: [],
    next: null,
    previous: null,
  );

  /// JSON de respuesta de la API para Pikachu
  static Map<String, dynamic> get pikachuApiJson => {
    'id': 25,
    'name': 'pikachu',
    'height': 4,
    'weight': 60,
    'types': [
      {
        'type': {'name': 'electric'},
      },
    ],
    'abilities': [
      {
        'ability': {'name': 'static'},
      },
      {
        'ability': {'name': 'lightning-rod'},
      },
    ],
    'stats': [
      {'base_stat': 35}, // hp
      {'base_stat': 55}, // attack
      {'base_stat': 40}, // defense
      {'base_stat': 50}, // special-attack
      {'base_stat': 50}, // special-defense
      {'base_stat': 90}, // speed
    ],
    'sprites': {
      'front_default':
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png',
    },
  };

  /// JSON de lista de Pokemon
  static Map<String, dynamic> get pokemonListApiJson => {
    'results': [
      {'name': 'bulbasaur', 'url': 'https://pokeapi.co/api/v2/pokemon/1/'},
      {'name': 'ivysaur', 'url': 'https://pokeapi.co/api/v2/pokemon/2/'},
      {'name': 'venusaur', 'url': 'https://pokeapi.co/api/v2/pokemon/3/'},
    ],
    'next': 'https://pokeapi.co/api/v2/pokemon?offset=20&limit=20',
    'previous': null,
  };
}

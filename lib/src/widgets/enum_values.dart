import 'dart:ui';

import 'package:global66/src/commons/enum_extensions.dart';

enum PokemonTypeList {
  normal,
  fire,
  water,
  grass,
  electric,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dragon,
  dark,
  steel,
  fairy,
}

String getPokemonTypeIcon(String type) {
  switch (type) {
    case 'normal':
      return PokemonTypeList.normal.icon;
    case 'fire':
      return PokemonTypeList.fire.icon;
    case 'water':
      return PokemonTypeList.water.icon;
    case 'grass':
      return PokemonTypeList.grass.icon;
    case 'electric':
      return PokemonTypeList.electric.icon;
    case 'ice':
      return PokemonTypeList.ice.icon;
    case 'fighting':
      return PokemonTypeList.fighting.icon;
    case 'poison':
      return PokemonTypeList.poison.icon;
    case 'ground':
      return PokemonTypeList.ground.icon;
    case 'flying':
      return PokemonTypeList.flying.icon;
    case 'psychic':
      return PokemonTypeList.psychic.icon;
    case 'bug':
      return PokemonTypeList.bug.icon;
    case 'ghost':
      return PokemonTypeList.ghost.icon;
    case 'dragon':
      return PokemonTypeList.dragon.icon;
    case 'dark':
      return PokemonTypeList.dark.icon;
    case 'rock':
      return PokemonTypeList.rock.icon;
    case 'steel':
      return PokemonTypeList.steel.icon;
    case 'fairy':
      return PokemonTypeList.fairy.icon;

    default:
      return PokemonTypeList.normal.icon;
  }
}

List<Color> getPokemonTypeColor(String type) {
  switch (type) {
    case 'normal':
      return PokemonTypeList.normal.colors;
    case 'fire':
      return PokemonTypeList.fire.colors;
    case 'water':
      return PokemonTypeList.water.colors;
    case 'grass':
      return PokemonTypeList.grass.colors;
    case 'electric':
      return PokemonTypeList.electric.colors;
    case 'ice':
      return PokemonTypeList.ice.colors;
    case 'fighting':
      return PokemonTypeList.fighting.colors;
    case 'poison':
      return PokemonTypeList.poison.colors;
    case 'ground':
      return PokemonTypeList.ground.colors;
    case 'flying':
      return PokemonTypeList.flying.colors;
    case 'psychic':
      return PokemonTypeList.psychic.colors;
    case 'bug':
      return PokemonTypeList.bug.colors;
    case 'ghost':
      return PokemonTypeList.ghost.colors;
    case 'dragon':
      return PokemonTypeList.dragon.colors;
    case 'dark':
      return PokemonTypeList.dark.colors;
    case 'rock':
      return PokemonTypeList.rock.colors;
    case 'steel':
      return PokemonTypeList.steel.colors;
    case 'fairy':
      return PokemonTypeList.fairy.colors;

    default:
      return PokemonTypeList.normal.colors;
  }
}

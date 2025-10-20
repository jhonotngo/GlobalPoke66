import 'package:flutter/material.dart';
import 'package:global66/src/constants/color.dart';
import 'package:global66/src/widgets/enum_values.dart';

extension EnumExtension on PokemonTypeList {
  String get icon {
    switch (this) {
      case PokemonTypeList.normal:
        return 'assets/images/types/normal.png';
      case PokemonTypeList.fire:
        return 'assets/images/types/fire.png';
      case PokemonTypeList.water:
        return 'assets/images/types/water.png';
      case PokemonTypeList.grass:
        return 'assets/images/types/grass.png';
      case PokemonTypeList.electric:
        return 'assets/images/types/electric.png';
      case PokemonTypeList.fighting:
        return 'assets/images/types/fighting.png';
      case PokemonTypeList.poison:
        return 'assets/images/types/poison.png';
      case PokemonTypeList.ground:
        return 'assets/images/types/ground.png';
      case PokemonTypeList.flying:
        return 'assets/images/types/flying.png';
      case PokemonTypeList.psychic:
        return 'assets/images/types/psychic.png';
      case PokemonTypeList.bug:
        return 'assets/images/types/bug.png';
      case PokemonTypeList.ghost:
        return 'assets/images/types/ghost.png';
      case PokemonTypeList.dragon:
        return 'assets/images/types/dragon.png';
      case PokemonTypeList.dark:
        return 'assets/images/types/dark.png';
      case PokemonTypeList.rock:
        return 'assets/images/types/rock.png';
      case PokemonTypeList.ice:
        return 'assets/images/types/ice.png';
      case PokemonTypeList.steel:
        return 'assets/images/types/steel.png';
      case PokemonTypeList.fairy:
        return 'assets/images/types/fairy.png';
    }
  }

  List<Color> get colors {
    switch (this) {
      case PokemonTypeList.normal:
        return [kNormal, kNormalOpacity];
      case PokemonTypeList.fire:
        return [kFire, kFireOpacity];
      case PokemonTypeList.water:
        return [kWater, kWaterOpacity];
      case PokemonTypeList.grass:
        return [kGrass, kGrassOpacity];
      case PokemonTypeList.electric:
        return [kElectric, kElectricOpacity];
      case PokemonTypeList.fighting:
        return [kFighting, kFightingOpacity];
      case PokemonTypeList.poison:
        return [kPoison, kPoisonOpacity];
      case PokemonTypeList.ground:
        return [kGround, kGroundOpacity];
      case PokemonTypeList.flying:
        return [kFlying, kFlyingOpacity];
      case PokemonTypeList.psychic:
        return [kPsychic, kPsychicOpacity];
      case PokemonTypeList.bug:
        return [kBug, kBugOpacity];
      case PokemonTypeList.ghost:
        return [kGhost, kGhostOpacity];
      case PokemonTypeList.dragon:
        return [kDragon, kDragonOpacity];
      case PokemonTypeList.dark:
        return [kDark, kDarkOpacity];
      case PokemonTypeList.rock:
        return [kRock, kRockOpacity];
      case PokemonTypeList.ice:
        return [kIce, kIceOpacity];
      case PokemonTypeList.steel:
        return [kSteel, kSteelOpacity];
      case PokemonTypeList.fairy:
        return [kFairy, kFairyOpacity];
    }
  }
}

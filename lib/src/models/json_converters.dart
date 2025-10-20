import 'package:freezed_annotation/freezed_annotation.dart';
import 'pokemon_detail_model.dart';

// Converter for nested sprite URL
class SpriteUrlConverter
    implements JsonConverter<String, Map<String, dynamic>> {
  const SpriteUrlConverter();

  @override
  String fromJson(Map<String, dynamic> json) {
    return json['front_default'] as String? ?? '';
  }

  @override
  Map<String, dynamic> toJson(String url) {
    return {'front_default': url};
  }
}

// Converter for types with nested structure
class TypeListConverter
    implements JsonConverter<List<PokemonType>, List<dynamic>> {
  const TypeListConverter();

  @override
  List<PokemonType> fromJson(List<dynamic> json) {
    return json.map((type) {
      return PokemonType(name: type['type']['name'] as String);
    }).toList();
  }

  @override
  List<dynamic> toJson(List<PokemonType> types) {
    return types
        .map(
          (type) => {
            'type': {'name': type.name},
          },
        )
        .toList();
  }
}

// Converter for abilities with nested structure
class AbilityListConverter
    implements JsonConverter<List<PokemonAbility>, List<dynamic>> {
  const AbilityListConverter();

  @override
  List<PokemonAbility> fromJson(List<dynamic> json) {
    return json.map((ability) {
      return PokemonAbility(name: ability['ability']['name'] as String);
    }).toList();
  }

  @override
  List<dynamic> toJson(List<PokemonAbility> abilities) {
    return abilities
        .map(
          (ability) => {
            'ability': {'name': ability.name},
          },
        )
        .toList();
  }
}

// Converter for stats from array format
class StatsConverter implements JsonConverter<PokemonStats, List<dynamic>> {
  const StatsConverter();

  @override
  PokemonStats fromJson(List<dynamic> json) {
    return PokemonStats(
      hp: json[0]['base_stat'] as int,
      attack: json[1]['base_stat'] as int,
      defense: json[2]['base_stat'] as int,
      specialAttack: json[3]['base_stat'] as int,
      specialDefense: json[4]['base_stat'] as int,
      speed: json[5]['base_stat'] as int,
    );
  }

  @override
  List<dynamic> toJson(PokemonStats stats) {
    return [
      {'base_stat': stats.hp},
      {'base_stat': stats.attack},
      {'base_stat': stats.defense},
      {'base_stat': stats.specialAttack},
      {'base_stat': stats.specialDefense},
      {'base_stat': stats.speed},
    ];
  }
}

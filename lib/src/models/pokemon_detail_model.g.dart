// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonDetailImpl _$$PokemonDetailImplFromJson(Map<String, dynamic> json) =>
    _$PokemonDetailImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      types: const TypeListConverter().fromJson(json['types'] as List),
      abilities: const AbilityListConverter().fromJson(
        json['abilities'] as List,
      ),
      stats: const StatsConverter().fromJson(json['stats'] as List),
      imageUrl: const SpriteUrlConverter().fromJson(
        json['sprites'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$PokemonDetailImplToJson(_$PokemonDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'types': const TypeListConverter().toJson(instance.types),
      'abilities': const AbilityListConverter().toJson(instance.abilities),
      'stats': const StatsConverter().toJson(instance.stats),
      'sprites': const SpriteUrlConverter().toJson(instance.imageUrl),
    };

_$PokemonTypeImpl _$$PokemonTypeImplFromJson(Map<String, dynamic> json) =>
    _$PokemonTypeImpl(name: json['name'] as String);

Map<String, dynamic> _$$PokemonTypeImplToJson(_$PokemonTypeImpl instance) =>
    <String, dynamic>{'name': instance.name};

_$PokemonAbilityImpl _$$PokemonAbilityImplFromJson(Map<String, dynamic> json) =>
    _$PokemonAbilityImpl(name: json['name'] as String);

Map<String, dynamic> _$$PokemonAbilityImplToJson(
  _$PokemonAbilityImpl instance,
) => <String, dynamic>{'name': instance.name};

_$PokemonStatsImpl _$$PokemonStatsImplFromJson(Map<String, dynamic> json) =>
    _$PokemonStatsImpl(
      hp: (json['hp'] as num).toInt(),
      attack: (json['attack'] as num).toInt(),
      defense: (json['defense'] as num).toInt(),
      specialAttack: (json['specialAttack'] as num).toInt(),
      specialDefense: (json['specialDefense'] as num).toInt(),
      speed: (json['speed'] as num).toInt(),
    );

Map<String, dynamic> _$$PokemonStatsImplToJson(_$PokemonStatsImpl instance) =>
    <String, dynamic>{
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'specialAttack': instance.specialAttack,
      'specialDefense': instance.specialDefense,
      'speed': instance.speed,
    };

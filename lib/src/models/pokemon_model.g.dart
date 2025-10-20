// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonImpl _$$PokemonImplFromJson(Map<String, dynamic> json) =>
    _$PokemonImpl(
      name: json['name'] as String,
      url: json['url'] as String,
      details: json['details'] == null
          ? null
          : PokemonDetail.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonImplToJson(_$PokemonImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'details': instance.details,
    };

_$PokemonResponseImpl _$$PokemonResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonResponseImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
    );

Map<String, dynamic> _$$PokemonResponseImplToJson(
        _$PokemonResponseImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
      'next': instance.next,
      'previous': instance.previous,
    };

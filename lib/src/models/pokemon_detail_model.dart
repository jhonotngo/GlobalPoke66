import 'package:freezed_annotation/freezed_annotation.dart';
import 'json_converters.dart';

part 'pokemon_detail_model.freezed.dart';
part 'pokemon_detail_model.g.dart';

@freezed
class PokemonDetail with _$PokemonDetail {
  const factory PokemonDetail({
    required int id,
    required String name,
    required int height,
    required int weight,
    @TypeListConverter() required List<PokemonType> types,
    @AbilityListConverter() required List<PokemonAbility> abilities,
    @StatsConverter() required PokemonStats stats,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'sprites') @SpriteUrlConverter() required String imageUrl,
  }) = _PokemonDetail;

  factory PokemonDetail.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailFromJson(json);
}

@freezed
class PokemonType with _$PokemonType {
  const factory PokemonType({required String name}) = _PokemonType;

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);
}

@freezed
class PokemonAbility with _$PokemonAbility {
  const factory PokemonAbility({required String name}) = _PokemonAbility;

  factory PokemonAbility.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityFromJson(json);
}

@freezed
class PokemonStats with _$PokemonStats {
  const PokemonStats._();

  const factory PokemonStats({
    required int hp,
    required int attack,
    required int defense,
    required int specialAttack,
    required int specialDefense,
    required int speed,
  }) = _PokemonStats;

  factory PokemonStats.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatsFromJson(json);

  int get total =>
      hp + attack + defense + specialAttack + specialDefense + speed;
}

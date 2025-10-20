import 'package:freezed_annotation/freezed_annotation.dart';
import 'pokemon_detail_model.dart';

part 'pokemon_model.freezed.dart';
part 'pokemon_model.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const Pokemon._();

  const factory Pokemon({
    required String name,
    required String url,
    PokemonDetail? details,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  String get id {
    final parts = url.split('/');
    return parts[parts.length - 2];
  }

  String get imageUrl {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }
}

@freezed
class PokemonResponse with _$PokemonResponse {
  const factory PokemonResponse({
    required List<Pokemon> results,
    String? next,
    String? previous,
  }) = _PokemonResponse;

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);
}

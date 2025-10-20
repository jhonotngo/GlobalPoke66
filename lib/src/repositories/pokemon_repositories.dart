import 'package:dio/dio.dart';
import 'package:global66/src/models/pokemon_detail_model.dart';
import 'package:global66/src/models/pokemon_model.dart';

class PokemonRepository {
  final Dio _dio;

  PokemonRepository({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: 'https://pokeapi.co/api/v2',
              connectTimeout: Duration(seconds: 3),
              receiveTimeout: Duration(seconds: 5),
            ),
          );

  Future<PokemonResponse> getPokemonList({
    int offset = 0,
    int limit = 20,
  }) async {
    try {
      final response = await _dio.get(
        '/pokemon',
        queryParameters: {'offset': offset, 'limit': limit},
      );
      return PokemonResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to fetch Pokémon: ${e.message}');
    }
  }

  Future<PokemonDetail> getPokemonDetailByName(String name) async {
    try {
      final response = await _dio.get('/pokemon/$name');
      return PokemonDetail.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to fetch Pokémon details: ${e.message}');
    }
  }
}

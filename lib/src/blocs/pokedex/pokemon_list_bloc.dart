import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global66/src/blocs/pokedex/pokemon_event_bloc.dart';
import 'package:global66/src/blocs/pokedex/pokemon_state_bloc.dart';
import 'package:global66/src/models/pokemon_model.dart';
import 'package:global66/src/repositories/pokemon_repositories.dart';

class PokemonListBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository repository;
  int _currentOffset = 0;
  final int _limit = 20;

  PokemonListBloc({required this.repository}) : super(PokemonInitial()) {
    on<LoadPokemon>(_onLoadPokemon);
    on<LoadMorePokemon>(_onLoadMorePokemon);
  }

  Future<void> _onLoadPokemon(
    LoadPokemon event,
    Emitter<PokemonState> emit,
  ) async {
    emit(PokemonLoading());
    try {
      _currentOffset = 0;
      final response = await repository
          .getPokemonList(offset: _currentOffset, limit: _limit)
          .timeout(
            Duration(seconds: 1),
            onTimeout: () {
              throw Exception('Timeout loading Pokemons');
            },
          );

      _currentOffset += _limit;

      // Load details for each pokemon, we want to display the types
      final pokemonsWithDetails = <Pokemon>[];
      for (var pokemon in response.results) {
        try {
          final details = await repository
              .getPokemonDetailByName(pokemon.name)
              .timeout(
                Duration(seconds: 10),
                onTimeout: () {
                  throw Exception('Timeout loading Pokemon details');
                },
              );
          pokemonsWithDetails.add(pokemon.copyWith(details: details));
        } catch (e) {
          if (kDebugMode) {
            print('Error loading details for ${pokemon.name}: $e');
          }
          // Add pokemon without details instead of failing completely
          pokemonsWithDetails.add(pokemon);
        }
      }

      emit(
        PokemonLoaded(
          pokemons: pokemonsWithDetails,
          hasMore: response.next != null,
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error loading pokemon list: $e');
      }
      emit(PokemonError(e.toString()));
    }
  }

  Future<void> _onLoadMorePokemon(
    LoadMorePokemon event,
    Emitter<PokemonState> emit,
  ) async {
    final currentState = state;
    if (currentState is PokemonLoaded && currentState.hasMore) {
      emit(PokemonLoadingMore(currentState.pokemons));
      try {
        final response = await repository.getPokemonList(
          offset: _currentOffset,
          limit: _limit,
        );
        _currentOffset += _limit;

        // Load details for new pokemons, we want to display the types
        final pokemonsWithDetails = <Pokemon>[];
        for (var pokemon in response.results) {
          try {
            final details = await repository.getPokemonDetailByName(
              pokemon.name,
            );
            pokemonsWithDetails.add(pokemon.copyWith(details: details));
          } catch (e) {
            pokemonsWithDetails.add(pokemon);
          }
        }

        emit(
          PokemonLoaded(
            pokemons: [...currentState.pokemons, ...pokemonsWithDetails],
            hasMore: response.next != null,
          ),
        );
      } catch (e) {
        emit(currentState);
      }
    }
  }
}

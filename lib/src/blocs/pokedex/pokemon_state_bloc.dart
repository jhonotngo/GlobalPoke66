import 'package:equatable/equatable.dart';
import 'package:global66/src/models/pokemon_model.dart';

abstract class PokemonState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final List<Pokemon> pokemons;
  final bool hasMore;

  PokemonLoaded({required this.pokemons, this.hasMore = true});

  @override
  List<Object?> get props => [pokemons, hasMore];

  PokemonLoaded copyWith({List<Pokemon>? pokemons, bool? hasMore}) {
    return PokemonLoaded(
      pokemons: pokemons ?? this.pokemons,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

class PokemonLoadingMore extends PokemonState {
  final List<Pokemon> pokemons;

  PokemonLoadingMore(this.pokemons);

  @override
  List<Object?> get props => [pokemons];
}

class PokemonError extends PokemonState {
  final String message;

  PokemonError(this.message);

  @override
  List<Object?> get props => [message];
}

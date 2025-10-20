import 'package:equatable/equatable.dart';

abstract class PokemonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadPokemon extends PokemonEvent {}

class LoadMorePokemon extends PokemonEvent {}

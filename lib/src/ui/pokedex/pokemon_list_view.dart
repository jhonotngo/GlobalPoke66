import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global66/src/blocs/pokedex/pokemon_event_bloc.dart';
import 'package:global66/src/blocs/pokedex/pokemon_list_bloc.dart';
import 'package:global66/src/blocs/pokedex/pokemon_state_bloc.dart';
import 'package:global66/src/constants/color.dart';
import 'package:global66/src/constants/font_size.dart';
import 'package:global66/src/models/pokemon_model.dart';
import 'package:global66/src/providers/pokedex/pokemon_provider.dart';
import 'package:global66/src/widgets/enum_values.dart';
import 'package:global66/src/widgets/image_with_description.dart';
import 'package:global66/src/widgets/pokemon_info_card.dart';
import 'package:global66/src/widgets/types_bottom_modal.dart';
import 'package:lottie/lottie.dart';

class PokemonList extends ConsumerStatefulWidget {
  const PokemonList({super.key});

  @override
  ConsumerState<PokemonList> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends ConsumerState<PokemonList> {
  final ScrollController _scrollController = ScrollController();
  PokemonListBloc? _pokemonBloc;

  final TextEditingController _searchController = TextEditingController();
  final String _searchQuery = '';
  Pokemon? _searchedPokemon;
  bool _isSearching = false;
  List<String> _selectedTypeFilters = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _pokemonBloc?.close();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && _pokemonBloc != null && _searchedPokemon == null) {
      _pokemonBloc!.add(LoadMorePokemon());
    }
  }

  Future<void> _performSearch() async {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) {
      setState(() {
        _searchedPokemon = null;
        _isSearching = false;
      });
      return;
    }

    setState(() {
      _isSearching = true;
    });

    try {
      final repository = ref.read(pokemonRepositoryProvider);
      final detail = await repository.getPokemonDetailByName(query);

      final pokemon = Pokemon(
        name: detail.name,
        url: 'https://pokeapi.co/api/v2/pokemon/${detail.id}/',
        details: detail,
      );

      setState(() {
        _searchedPokemon = pokemon;
        _isSearching = false;
      });
    } catch (e) {
      setState(() {
        _searchedPokemon = null;
        _isSearching = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              FlutterI18n.translate(context, "pokemon_list.poke_not_found"),
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _searchedPokemon = null;
      _isSearching = false;
    });
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,

      isScrollControlled: true,
      useSafeArea: false,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,

      builder:
          (context) => TypesBottomModal(
            selectedTypes: _selectedTypeFilters,
            onApply: (selectedTypes) {
              setState(() {
                _selectedTypeFilters = selectedTypes;
              });
            },
          ),
    );
  }

  List<Pokemon> _applyTypeFilter(List<Pokemon> pokemons) {
    if (_selectedTypeFilters.isEmpty) {
      return pokemons;
    }
    return pokemons.where((pokemon) {
      if (pokemon.details == null) return false;
      return pokemon.details!.types.any(
        (type) => _selectedTypeFilters.contains(type.name.toLowerCase()),
      );
    }).toList();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: TextField(
                controller: _searchController,
                onSubmitted: (_) => _performSearch(),
                decoration: InputDecoration(
                  hintText: FlutterI18n.translate(
                    context,
                    "pokemon_list.search",
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 16,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade400,
                    size: 24,
                  ),
                  suffixIcon:
                      _searchedPokemon != null ||
                              _searchController.text.isNotEmpty
                          ? IconButton(
                            icon: Icon(
                              Icons.clear,
                              color: Colors.grey.shade400,
                            ),
                            onPressed: _clearSearch,
                          )
                          : null,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.grey.shade600),
              onPressed: () {
                if (_isSearching) {
                  null;
                } else {
                  FocusManager.instance.primaryFocus?.unfocus();
                  _performSearch();
                }
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color:
                  _selectedTypeFilters.isNotEmpty
                      ? Colors.red.shade700
                      : Colors.grey.shade100,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: IconButton(
              icon: Stack(
                children: [
                  Icon(
                    Icons.filter_list,
                    color:
                        _selectedTypeFilters.isNotEmpty
                            ? Colors.white
                            : Colors.grey.shade600,
                  ),
                  if (_selectedTypeFilters.isNotEmpty)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        constraints: BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '${_selectedTypeFilters.length}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
              onPressed: _showFilterModal,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final repository = ref.watch(pokemonRepositoryProvider);

    _pokemonBloc ??= PokemonListBloc(repository: repository)
      ..add(LoadPokemon());

    return BlocProvider.value(
      value: _pokemonBloc!,
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<PokemonListBloc, PokemonState>(
            builder: (context, state) {
              if (state is PokemonLoading) {
                return Center(
                  child: Lottie.asset(
                    'assets/animations/pokemonShake.json',
                    width: 100,
                    height: 100,
                  ),
                );
              }

              if (state is PokemonError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageWithDescription(
                      context: context,
                      image: Image.asset(
                        'assets/images/utils/magikarp.png',
                        scale: 0.2,
                        fit: BoxFit.contain,
                        width: 200,
                      ),
                      title: FlutterI18n.translate(
                        context,
                        "pokemon_list.error_title",
                      ),
                      description: FlutterI18n.translate(
                        context,
                        "pokemon_list.error_description",
                      ),
                      topRatio: 0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            _pokemonBloc?.add(LoadPokemon());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kBlueButton,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            elevation: 2,
                          ),
                          child: Text(
                            FlutterI18n.translate(
                              context,
                              "pokemon_list.retry",
                            ),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }

              if (state is PokemonLoaded || state is PokemonLoadingMore) {
                final pokemons =
                    state is PokemonLoaded
                        ? state.pokemons
                        : (state as PokemonLoadingMore).pokemons;

                var filterPokemons = _applyTypeFilter(pokemons);
                bool hasfilters = filterPokemons.length < pokemons.length;
                filterPokemons =
                    _searchedPokemon != null
                        ? [_searchedPokemon!]
                        : filterPokemons;

                Locale currentLocale = Localizations.localeOf(context);
                String languageCode = currentLocale.languageCode;

                return CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(child: _buildSearchBar()),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child:
                            hasfilters
                                ? Center(
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              languageCode == 'es'
                                                  ? FlutterI18n.translate(
                                                    context,
                                                    "pokemon_list.found",
                                                  )
                                                  : '${filterPokemons.length} ${FlutterI18n.translate(context, "pokemon_list.results")}',

                                          style: TextStyle(
                                            color: kfilterResult,
                                            fontSize: kFilterResultText,
                                            fontWeight:
                                                languageCode == 'es'
                                                    ? FontWeight.normal
                                                    : FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              languageCode == 'es'
                                                  ? '${filterPokemons.length} ${FlutterI18n.translate(context, "pokemon_list.results")}'
                                                  : FlutterI18n.translate(
                                                    context,
                                                    "pokemon_list.found",
                                                  ),
                                          style: TextStyle(
                                            color: kfilterResult,
                                            fontSize: kFilterResultText,
                                            fontWeight:
                                                languageCode == 'es'
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: FlutterI18n.translate(
                                            context,
                                            "pokemon_list.clean_filter",
                                          ),
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Colors.blue,
                                            fontSize: kFilterResultText,
                                            color: Colors.blue,
                                          ),
                                          recognizer:
                                              TapGestureRecognizer()
                                                ..onTap = () {
                                                  setState(() {
                                                    _selectedTypeFilters
                                                        .clear();
                                                  });
                                                },
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                : Offstage(),
                      ),
                    ),
                    if (filterPokemons.isEmpty && _searchQuery.isNotEmpty)
                      SliverFillRemaining(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search_off,
                                size: 80,
                                color: Colors.grey.shade400,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'No Pokémon found',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Try searching with a different name',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              if (index >= filterPokemons.length &&
                                  _searchedPokemon == null &&
                                  _selectedTypeFilters.isEmpty) {
                                return Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Center(
                                      child: Lottie.asset(
                                        'assets/animations/pokemonShake.json',
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                  ),
                                );
                              }

                              if (index >= filterPokemons.length) {
                                return SizedBox.shrink();
                              }

                              final pokemon = filterPokemons[index];
                              final backgroundColor = getPokemonTypeColor(
                                pokemon.details!.types.first.name,
                              );

                              return PokemonInfoCard(
                                backgroundColor: backgroundColor,
                                pokemon: pokemon,
                              );
                            },
                            childCount:
                                pokemons.length +
                                (state is PokemonLoadingMore &&
                                        _searchQuery.isEmpty
                                    ? 1
                                    : 0),
                          ),
                        ),
                      ),
                  ],
                );
              }

              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

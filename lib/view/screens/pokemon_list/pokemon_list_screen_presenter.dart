import 'package:Pokedex/controller/pokemon/pokemon_crud_controller.dart';
import 'package:Pokedex/misc/app_response.dart';
import 'package:Pokedex/model/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonListScreenPresenter extends ChangeNotifier {
  List<Pokemon> _pokemons = List<Pokemon>();
  List<Pokemon> get pokemons => _pokemons;

  ScrollController _scrollController = new ScrollController();
  ScrollController get scrollController => _scrollController;

  bool _loading = false;
  bool get loading => _loading;

  int _limit = 100;
  int get limit => _limit;
  int _offset = 0;

  PokemonCrudController _controller = new PokemonCrudController();

  Future<void> onViewStarted() async {
    fetchNextPokemon();
    _scrollController.addListener(() async {
      if (!_loading &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        await fetchNextPokemon();
      }
    });
  }

  Future<void> fetchNextPokemon() async {
    _loading = true;
    notifyListeners();
    AppResponse<List<Pokemon>> getPokemonResponse =
        await _controller.getWithPagination(_limit, _offset);
    if (getPokemonResponse.isSuccess()) {
      _offset = _offset + _limit;
      _pokemons.addAll(getPokemonResponse.payload);
    }
    _loading = false;
    notifyListeners();
  }
}

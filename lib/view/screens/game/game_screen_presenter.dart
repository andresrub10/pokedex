import 'package:Pokedex/controller/pokemon/pokemon_crud_controller.dart';
import 'package:Pokedex/misc/app_response.dart';
import 'package:Pokedex/misc/random_helper.dart';
import 'package:Pokedex/misc/service_locator.dart';
import 'package:Pokedex/model/pokemon.dart';
import 'package:Pokedex/navigators/game_navigator/game_navigator.dart';
import 'package:Pokedex/view/screens/dashboard/pokedex_presenter.dart';
import 'package:flutter/material.dart';

class GameScreenPresenter extends ChangeNotifier {
  PokedexPresenter _pokedexPresenter;

  bool _idle;
  bool get idle => _idle;

  bool _engaging;
  bool get engaging => _engaging;

  bool _catching;
  bool get catching => _catching;

  bool _caught;
  bool get caught => _caught;

  Pokemon _engagedPokemon;
  Pokemon get engagedPokemon => _engagedPokemon;

  GameNavigator _gameNavigator = locator<GameNavigator>();

  GameScreenPresenter(this._pokedexPresenter);

  onViewCreated() {
    _idle = true;
    _engaging = false;
    _catching = false;
    _engagedPokemon = null;
    _caught = null;
    notifyListeners();
  }

  Future<void> findPokemon() async {
    _engaging = true;
    _idle = false;
    notifyListeners();

    PokemonCrudController controller = new PokemonCrudController();

    AppResponse<Pokemon> response =
        await controller.getById(RandomHelper.getRandomInt(807).toString());
    if (response.isSuccess()) {
      _engagedPokemon = response.payload;
      _engaging = false;
      _pokedexPresenter.addSeen(_engagedPokemon);
    } else {
      _idle = true;
    }
    _engaging = false;
    notifyListeners();
  }

  void flee() {
    _engagedPokemon = null;
    _idle = true;
    notifyListeners();
  }

  Future<void> catchPokemon() async {
    _caught = null;
    _catching = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: RandomHelper.getRandomInt(6)));
    //50% probabilities
    _caught = RandomHelper.getRandomInt(10) < 5;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    if (_caught != null && _caught) {
      _gameNavigator.toPokemonDetail(_engagedPokemon);
      await Future.delayed(Duration(seconds: 1));
      _idle = true;
      _pokedexPresenter.addCaught(_engagedPokemon);
      _engagedPokemon = null;
    }
    _catching = false;
    notifyListeners();
  }
}

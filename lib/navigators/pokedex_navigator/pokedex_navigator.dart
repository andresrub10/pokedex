import 'package:Pokedex/model/pokemon.dart';
import 'package:Pokedex/navigators/pokedex_navigator/pokedex_routes.dart';
import 'package:Pokedex/view/screens/pokemon_detail/pokemon_detail_screen.dart';
import 'package:Pokedex/view/screens/pokemon_list/pokemon_list_screen.dart';
import 'package:flutter/material.dart';

class PokedexNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> toPokemonList() {
    return _pushRoute(PokedexRoutes.pokemonList, clearStack: true);
  }

  Future<void> toPokemonDetail(Pokemon pokemon) {
    return _pushRoute(PokedexRoutes.pokemonDetail, arguments: pokemon);
  }

  popScreen() {
    navigatorKey.currentState.pop();
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PokedexRoutes.pokemonList:
        return MaterialPageRoute(builder: (context) => PokemonListScreen());
      case PokedexRoutes.pokemonDetail:
        return MaterialPageRoute(
            builder: (context) =>
                PokemonDetailScreen(pokemon: settings.arguments));
    }
    return null;
  }

  Future<T> _pushRoute<T>(String routeName,
      {Object arguments, bool clearStack = false}) {
    if (clearStack) {
      return navigatorKey.currentState.pushNamedAndRemoveUntil<T>(
          routeName, (route) => false,
          arguments: arguments);
    } else {
      return navigatorKey.currentState
          .pushNamed<T>(routeName, arguments: arguments);
    }
  }
}

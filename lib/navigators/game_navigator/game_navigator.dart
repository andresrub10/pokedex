import 'package:Pokedex/model/pokemon.dart';
import 'package:Pokedex/navigators/game_navigator/game_routes.dart';
import 'package:Pokedex/view/screens/game/game_screen.dart';
import 'package:Pokedex/view/screens/pokemon_detail/pokemon_detail_screen.dart';
import 'package:flutter/material.dart';

class GameNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> toGame() {
    return _pushRoute(GameRoutes.game, clearStack: true);
  }

  popScreen() {
    navigatorKey.currentState.pop();
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case GameRoutes.game:
        return MaterialPageRoute(builder: (context) => GameScreen());
      case GameRoutes.pokemonDetail:
        return MaterialPageRoute(
            builder: (context) =>
                PokemonDetailScreen(pokemon: settings.arguments));
    }
    return null;
  }

  Future<void> toPokemonDetail(Pokemon pokemon) {
    return _pushRoute(GameRoutes.pokemonDetail, arguments: pokemon);
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

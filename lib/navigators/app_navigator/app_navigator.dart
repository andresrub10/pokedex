import 'package:Pokedex/model/pokemon.dart';
import 'package:Pokedex/view/screens/authentication/auth_home_screen.dart';
import 'package:Pokedex/view/screens/pokemon_detail/pokemon_detail_screen.dart';
import 'package:Pokedex/view/screens/pokemon_list/pokemon_list_screen.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> toDashboard() {
    return _pushRoute(AppRoutes.dashboard, clearStack: true);
  }

  Future<void> toAuthentication() {
    return _pushRoute(AppRoutes.authentication, clearStack: true);
  }

  Future<void> toPokemonList() {
    return _pushRoute(AppRoutes.pokemonList, clearStack: true);
  }

  Future<void> toPokemonDetail(Pokemon pokemon) {
    return _pushRoute(AppRoutes.pokemonDetail, arguments: pokemon);
  }

  popScreen() {
    navigatorKey.currentState.pop();
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (context) => Text("Dashboard")
            /*Dashboard()*/);
      case AppRoutes.pokemonList:
        return MaterialPageRoute(builder: (context) => PokemonListScreen());
      case AppRoutes.pokemonDetail:
        return MaterialPageRoute(
            builder: (context) =>
                PokemonDetailScreen(pokemon: settings.arguments));

      case AppRoutes.authentication:
        return MaterialPageRoute(builder: (context) => AuthHomeScreen());
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

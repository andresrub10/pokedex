import 'package:Pokedex/view/screens/dashboard/pokedex_presenter.dart';
import 'package:Pokedex/view/screens/game/battle_screen.dart';
import 'package:Pokedex/view/screens/game/engaging_screen.dart';
import 'package:Pokedex/view/screens/game/game_screen_presenter.dart';
import 'package:Pokedex/view/screens/game/idle_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  GameScreenPresenter _createGameScreenPresenter(
      PokedexPresenter pokedexPresenter) {
    return GameScreenPresenter(pokedexPresenter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<PokedexPresenter>(
        builder: (context, pokedexPresenter, staticChild) {
      return ChangeNotifierProvider<GameScreenPresenter>(
          create: (context) =>
              _createGameScreenPresenter(pokedexPresenter)..onViewCreated(),
          child: Consumer<GameScreenPresenter>(
              builder: (context, presenter, staticChild) {
            if (presenter.idle) {
              return IdleScreen(
                action: presenter.findPokemon,
              );
            } else if (presenter.engaging) {
              return EngagingScreen();
            } else if (presenter.engagedPokemon != null) {
              return BattleScreen();
            } else {
              return Container();
            }
          }));
    }));
  }
}

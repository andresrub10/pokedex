import 'package:Pokedex/misc/constants/app_constants.dart';
import 'package:Pokedex/misc/string_helper.dart';
import 'package:Pokedex/view/components/buttons/primary_button.dart';
import 'package:Pokedex/view/screens/game/game_screen_presenter.dart';
import 'package:Pokedex/view/screens/pokemon_detail/components/pokemon_details_bordered_section_component.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BattleScreen extends StatelessWidget {
  BattleScreen();

  @override
  Widget build(BuildContext context) {
    return Consumer<GameScreenPresenter>(
        builder: (context, presenter, staticChild) {
      return Center(
        child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPokemonSection(context, presenter),
                _buildAshSection(context, presenter),
                _buildActionSection(context, presenter),
                _buildLogSection(context, presenter)
              ],
            )),
      );
    });
  }

  Widget _buildPokemonSection(
      BuildContext context, GameScreenPresenter presenter) {
    Widget pokemonOrPokeball;

    if (presenter.catching && presenter.caught == null) {
      pokemonOrPokeball = Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Image.asset(
            AppConstants.IMAGES_ASSETS_PATH + "pokeball_pending.gif"),
      );
    } else if (presenter.catching && presenter.caught) {
      pokemonOrPokeball = Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Image.asset(
            AppConstants.IMAGES_ASSETS_PATH + "pokeball_pending.jpg"),
      );
    } else {
      pokemonOrPokeball = Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: CachedNetworkImage(
            imageUrl: presenter.engagedPokemon.mainImageUrl,
          ));
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: pokemonOrPokeball,
        )
      ]),
    );
  }

  Widget _buildAshSection(BuildContext context, GameScreenPresenter presenter) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Image.asset(
              AppConstants.IMAGES_ASSETS_PATH + "ash_backwards.png"),
        ),
      ]),
    );
  }

  Widget _buildActionSection(
      BuildContext context, GameScreenPresenter presenter) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        children: [
          Expanded(
            child: PrimaryButton(
              disabled: presenter.catching,
              action: presenter.catchPokemon,
              child: Text("Catch Pokemon!",
                  style: Theme.of(context).textTheme.headline1),
              color: Colors.green,
              highlightColor: Colors.greenAccent,
            ),
          ),
          Container(
            width: 25,
          ),
          Expanded(
            child: PrimaryButton(
              disabled: presenter.catching,
              action: presenter.flee,
              child:
                  Text("Flee!", style: Theme.of(context).textTheme.headline1),
              color: Theme.of(context).primaryColor,
              highlightColor: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogSection(BuildContext context, GameScreenPresenter presenter) {
    String logText;

    if (presenter.catching && presenter.caught == null) {
      logText = "You threw a Pokeball at " +
          StringHelper.capitalize(presenter.engagedPokemon.name) +
          "!";
    } else if (presenter.catching && presenter.caught) {
      logText = "You caught " +
          StringHelper.capitalize(presenter.engagedPokemon.name) +
          "!";
    } else if (presenter.catching && !presenter.caught) {
      logText =
          StringHelper.capitalize(presenter.engagedPokemon.name) + " escaped!";
    } else {
      logText = "A wild " +
          StringHelper.capitalize(presenter.engagedPokemon.name) +
          " appeared!";
    }
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: PokemonDetailsBorderedSectionComponent(
        height: MediaQuery.of(context).size.height * 0.16,
        title: "Battle",
        child: Center(
          child: Container(
            child: Text(
              logText,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
      ),
    );
  }
}

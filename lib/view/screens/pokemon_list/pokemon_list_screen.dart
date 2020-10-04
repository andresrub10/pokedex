import 'package:Pokedex/misc/constants/app_constants.dart';
import 'package:Pokedex/misc/theme.dart';
import 'package:Pokedex/view/components/app_bars/main_app_bar.dart';
import 'package:Pokedex/view/screens/pokemon_list/pokemon_list_item.dart';
import 'package:Pokedex/view/screens/pokemon_list/pokemon_list_screen_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonListScreen extends StatelessWidget {
  PokemonListScreenPresenter _createViewModel() {
    return PokemonListScreenPresenter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(),
        body: ChangeNotifierProvider<PokemonListScreenPresenter>(
            create: (context) => _createViewModel()..onViewStarted(),
            child: Consumer<PokemonListScreenPresenter>(
                builder: (context, presenter, staticChild) {
              if (presenter.pokemons.length > 0) {
                return Stack(
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width -
                            horizontalMargin,
                        child: ListView.builder(
                          itemBuilder: (context, index) => PokemonListItem(
                            pokemon: presenter.pokemons[index],
                          ),
                          itemCount: presenter.pokemons.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          controller: presenter.scrollController,
                        ),
                      ),
                    ),
                    presenter.loading
                        ? Positioned(
                            bottom: 0,
                            left: MediaQuery.of(context).size.width * 0.4,
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height: MediaQuery.of(context).size.width * 0.2,
                                child: Image.asset(
                                    AppConstants.IMAGES_ASSETS_PATH +
                                        "pokeball-logo.gif")),
                          )
                        : Container(),
                  ],
                );
              } else {
                return Center(
                  child: Container(
                      width: 120,
                      height: 120,
                      child: Image.asset(AppConstants.IMAGES_ASSETS_PATH +
                          "pokeball-logo.gif")),
                );
              }
            })));
  }
}

import 'package:Pokedex/model/pokemon.dart';
import 'package:Pokedex/view/components/app_bars/main_app_bar.dart';
import 'package:Pokedex/view/screens/dashboard/pokedex_presenter.dart';
import 'package:Pokedex/view/screens/pokemon_detail/components/pokemon_detail_detail_section.dart';
import 'package:Pokedex/view/screens/pokemon_detail/components/pokemon_detail_flavor_text_section_component.dart';
import 'package:Pokedex/view/screens/pokemon_detail/components/pokemon_detail_image_section_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/pokemon_detail_types_section_component.dart';

class PokemonDetailScreen extends StatelessWidget {
  Pokemon pokemon;
  double parentHeight;
  double parentWidth;
  PokemonDetailScreen({this.pokemon});

  @override
  Widget build(BuildContext context) {
    parentHeight = MediaQuery.of(context).size.height * 0.8;
    parentWidth = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
        appBar: MainAppBar(),
        body: Consumer<PokedexPresenter>(
            builder: (context, presenter, staticChild) {
          return Center(
            child: Container(
              decoration: _getOuterBorderDecoration(context),
              width: parentWidth,
              height: parentHeight,
              child: Container(
                decoration: _getInnerBorderDecoration(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: parentHeight * 0.4,
                      child: Row(
                        children: [
                          PokemonDetailImageSectionComponent(
                              width: parentWidth,
                              pokemon: pokemon,
                              isSeen: presenter.isSeen(pokemon),
                              isCaught: presenter.isCaught(pokemon)),
                          PokemonDetailDetailSectionComponent(
                            pokemon: pokemon,
                            width: parentWidth,
                            isSeen: presenter.isSeen(pokemon),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: parentHeight * 0.25,
                      child: PokemonDetailTypesSectionComponent(
                          pokemon: pokemon,
                          width: parentWidth,
                          height: parentHeight * 0.2,
                          isSeen: presenter.isSeen(pokemon)),
                    ),
                    Container(
                      height: parentHeight * 0.25,
                      child: PokemonDetailFlavorTextSectionComponent(
                          pokemon: pokemon,
                          width: parentWidth,
                          height: parentHeight * 0.2,
                          isSeen: presenter.isSeen(pokemon)),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }

  BoxDecoration _getOuterBorderDecoration(BuildContext context) {
    return BoxDecoration(
        border: Border(
            top: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 20,
                style: BorderStyle.solid),
            bottom: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 20,
                style: BorderStyle.solid),
            left: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 7,
                style: BorderStyle.solid),
            right: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
                style: BorderStyle.solid)));
  }

  BoxDecoration _getInnerBorderDecoration(BuildContext context) {
    return BoxDecoration(
      border:
          Border.all(color: Colors.white, width: 3, style: BorderStyle.solid),
    );
  }
}

import 'package:Pokedex/model/pokemon.dart';
import 'package:Pokedex/view/screens/pokemon_detail/components/pokemon_details_bordered_section_component.dart';
import 'package:flutter/material.dart';

class PokemonDetailFlavorTextSectionComponent extends StatelessWidget {
  Pokemon pokemon;
  double width;
  double height;
  bool isSeen;

  PokemonDetailFlavorTextSectionComponent(
      {this.pokemon, this.width, this.height, this.isSeen});

  @override
  Widget build(BuildContext context) {
    return PokemonDetailsBorderedSectionComponent(
      height: height,
      title: "Description",
      child: Container(
        width: width * 0.9,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Text(
            isSeen ? pokemon.flavorText : "??????",
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ),
    );
  }
}

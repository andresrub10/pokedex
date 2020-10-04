import 'package:Pokedex/misc/string_helper.dart';
import 'package:Pokedex/model/pokemon.dart';
import 'package:Pokedex/view/screens/pokemon_detail/components/pokemon_details_bordered_section_component.dart';
import 'package:flutter/material.dart';

class PokemonDetailTypesSectionComponent extends StatelessWidget {
  Pokemon pokemon;
  double width;
  double height;
  bool isSeen;

  PokemonDetailTypesSectionComponent(
      {this.pokemon, this.width, this.height, this.isSeen});

  @override
  Widget build(BuildContext context) {
    return PokemonDetailsBorderedSectionComponent(
      height: height,
      title: "Types",
      child: Container(
        width: width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _buildTypes(context),
        ),
      ),
    );
  }

  List<Widget> _buildTypes(BuildContext context) {
    List<Widget> output = List<Widget>();
    for (String actualType in pokemon.types) {
      output.add(Text(
        isSeen ? StringHelper.capitalize(actualType) : "??????",
        style: Theme.of(context).textTheme.display1,
      ));
    }

    return output;
  }
}

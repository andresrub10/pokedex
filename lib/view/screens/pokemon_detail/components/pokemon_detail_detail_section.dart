import 'package:Pokedex/misc/string_helper.dart';
import 'package:Pokedex/model/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonDetailDetailSectionComponent extends StatelessWidget {
  Pokemon pokemon;
  double width;

  PokemonDetailDetailSectionComponent({this.pokemon, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.43,
      padding: EdgeInsets.only(top: 50, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringHelper.capitalize(pokemon.name),
            style: Theme.of(context)
                .textTheme
                .display2
                .copyWith(fontWeight: FontWeight.normal),
          ),
          Container(height: 10),
          Text(
            "HT:       " + pokemon.height.toString() + " cm.",
            style: Theme.of(context)
                .textTheme
                .display2
                .copyWith(fontWeight: FontWeight.normal),
          ),
          Container(height: 10),
          Text(
            "WT:       " + pokemon.weight.toString() + " lbs.",
            style: Theme.of(context)
                .textTheme
                .display2
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

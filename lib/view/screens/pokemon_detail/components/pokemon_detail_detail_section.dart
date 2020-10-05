import 'package:Pokedex/misc/string_helper.dart';
import 'package:Pokedex/model/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonDetailDetailSectionComponent extends StatelessWidget {
  Pokemon pokemon;
  double width;
  bool isSeen;

  PokemonDetailDetailSectionComponent({this.pokemon, this.width, this.isSeen});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.43,
      padding: EdgeInsets.only(top: 35, left: 20),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width * 0.4,
                child: Text(
                  isSeen ? StringHelper.capitalize(pokemon.name) : "??????",
                  overflow: TextOverflow.clip,
                  style: Theme.of(context)
                      .textTheme
                      .display2
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ),
              Container(height: 10),
              Text(
                isSeen
                    ? "HT:       " + pokemon.height.toString() + " cm."
                    : "HT:      ???  cm.",
                style: Theme.of(context)
                    .textTheme
                    .display2
                    .copyWith(fontWeight: FontWeight.normal),
              ),
              Container(height: 10),
              Text(
                isSeen
                    ? "WT:       " + pokemon.weight.toString() + " lbs"
                    : "WT:      ???  lbs.",
                style: Theme.of(context)
                    .textTheme
                    .display2
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ],
          )
        ],
      ),
    );
  }
}

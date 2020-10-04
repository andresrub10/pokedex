import 'package:Pokedex/model/pokemon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailImageSectionComponent extends StatelessWidget {
  double width;
  Pokemon pokemon;

  PokemonDetailImageSectionComponent({this.width, this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.5,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 12, left: 6),
            width: width * 0.5,
            height: width * 0.5,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: CachedNetworkImageProvider(pokemon.mainImageUrl))),
          ),
          Text(
            "No. " + pokemon.number.toString(),
            style: Theme.of(context).textTheme.display2,
          ),
        ],
      ),
    );
  }
}

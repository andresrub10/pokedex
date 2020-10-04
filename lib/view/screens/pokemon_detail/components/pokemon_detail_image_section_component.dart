import 'package:Pokedex/misc/constants/app_constants.dart';
import 'package:Pokedex/model/pokemon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailImageSectionComponent extends StatelessWidget {
  double width;
  Pokemon pokemon;
  bool isSeen;
  bool isCaught;

  PokemonDetailImageSectionComponent(
      {this.width, this.pokemon, this.isSeen, this.isCaught});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.5,
      child: Column(
        children: [
          isSeen
              ? Container(
                  margin: EdgeInsets.only(top: 12, left: 6),
                  width: width * 0.5,
                  height: width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image:
                            CachedNetworkImageProvider(pokemon.demoImageUrl)),
                  ))
              : Container(
                  margin: EdgeInsets.only(top: 12, left: 6),
                  width: width * 0.5,
                  height: width * 0.5,
                  color: Colors.white,
                  child: ShaderMask(
                    child: Image(
                      image: CachedNetworkImageProvider(pokemon.demoImageUrl),
                    ),
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [Colors.black, Colors.black],
                        stops: [
                          0.0,
                          0.5,
                        ],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcATop,
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No. " + pokemon.number.toString(),
                style: Theme.of(context).textTheme.display2,
              ),
              isCaught
                  ? Container(
                      margin: EdgeInsets.only(left: 5),
                      width: 20,
                      height: 20,
                      child: Image.asset(AppConstants.IMAGES_ASSETS_PATH +
                          "pokeball_transparent.png"))
                  : Container(
                      margin: EdgeInsets.only(left: 5),
                      width: 20,
                      height: 20,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

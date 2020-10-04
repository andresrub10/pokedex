import 'package:Pokedex/misc/service_locator.dart';
import 'package:Pokedex/misc/string_helper.dart';
import 'package:Pokedex/misc/theme.dart';
import 'package:Pokedex/model/pokemon.dart';
import 'package:Pokedex/navigators/app_navigator/app_navigator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';

class PokemonListItem extends StatelessWidget {
  Pokemon pokemon;
  PokemonListItem({this.pokemon});
  AppNavigator _navigator = locator<AppNavigator>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _navigator.toPokemonDetail(pokemon);
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: ShapeDecoration(
              shape: PixelBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderColor: Theme.of(context).primaryColor,
                  pixelSize: 3,
                  style: BorderStyle.solid)),
          width: MediaQuery.of(context).size.width - horizontalMargin,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "No. " + pokemon.number.toString(),
                style: Theme.of(context).textTheme.display1,
              ),
              Text(
                StringHelper.capitalize(pokemon.name),
                style: Theme.of(context).textTheme.display1,
              ),
              Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            CachedNetworkImageProvider(pokemon.demoImageUrl)),
                  ))
            ],
          )),
    );
  }
}

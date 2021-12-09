import 'package:Pokedex/misc/constants/app_constants.dart';
import 'package:Pokedex/misc/service_locator.dart';
import 'package:Pokedex/misc/string_helper.dart';
import 'package:Pokedex/misc/theme.dart';
import 'package:Pokedex/model/pokemon.dart';
import 'package:Pokedex/navigators/pokedex_navigator/pokedex_navigator.dart';
import 'package:Pokedex/view/screens/dashboard/pokedex_presenter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:provider/provider.dart';

class PokemonListItem extends StatelessWidget {
  Pokemon pokemon;
  PokemonListItem({this.pokemon});
  PokedexNavigator _navigator = locator<PokedexNavigator>();

  @override
  Widget build(BuildContext context) {
    return Consumer<PokedexPresenter>(
        builder: (context, presenter, staticChild) {
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
                Row(
                  children: [
                    Text(
                      "No. " + pokemon.number.toString(),
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    presenter.isCaught(pokemon)
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
                Text(
                  presenter.isSeen(pokemon)
                      ? StringHelper.capitalize(pokemon.name)
                      : "??????",
                  style: Theme.of(context).textTheme.headline1,
                ),
                presenter.isSeen(pokemon)
                    ? Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  pokemon.demoImageUrl)),
                        ))
                    : Container(
                        height: 30,
                        width: 30,
                        child: ShaderMask(
                          child: Image(
                            image: CachedNetworkImageProvider(
                                pokemon.demoImageUrl),
                          ),
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: [Colors.white, Colors.white],
                              stops: [
                                0.0,
                                0.5,
                              ],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.srcATop,
                        ),
                      )
              ],
            )),
      );
    });
  }
}

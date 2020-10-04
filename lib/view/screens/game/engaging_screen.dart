import 'package:Pokedex/misc/constants/app_constants.dart';
import 'package:flutter/material.dart';

class EngagingScreen extends StatelessWidget {
  EngagingScreen();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Image.asset(AppConstants.IMAGES_ASSETS_PATH + "engaging.gif"),
        ),
      ),
    );
  }
}

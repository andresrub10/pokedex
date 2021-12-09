import 'package:Pokedex/misc/constants/app_constants.dart';
import 'package:Pokedex/view/components/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class IdleScreen extends StatelessWidget {
  Function action;

  IdleScreen({this.action});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child:
                  Image.asset(AppConstants.IMAGES_ASSETS_PATH + "ashwalk.gif"),
            ),
            Container(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: PrimaryButton(
                child: Text(
                  "Find pokemon!",
                  style: Theme.of(context).textTheme.headline4,
                ),
                color: Colors.green,
                highlightColor: Colors.greenAccent,
                action: action,
              ),
            )
          ],
        ),
      ),
    );
  }
}

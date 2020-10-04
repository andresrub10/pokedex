import 'package:Pokedex/view/components/app_bars/main_app_bar.dart';
import 'package:Pokedex/view/components/buttons/primary_button.dart';
import 'package:Pokedex/view/screens/dashboard/pokedex_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PokedexPresenter>(
        builder: (context, presenter, staticChild) {
      return Scaffold(
        appBar: MainAppBar(),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  color: Colors.blue,
                  highlightColor: Colors.blueAccent,
                  child: Text(
                    "Reset Pokedex to all seen.",
                    style: Theme.of(context).textTheme.display1,
                  ),
                  action: presenter.allToSeen,
                ),
                Container(
                  height: 25,
                ),
                PrimaryButton(
                  color: Colors.green,
                  highlightColor: Colors.greenAccent,
                  child: Text(
                    "Reset Pokedex to all seen and caught.",
                    style: Theme.of(context).textTheme.display1,
                  ),
                  action: presenter.allToSeenAndCaught,
                ),
                Container(
                  height: 25,
                ),
                PrimaryButton(
                  color: Colors.red,
                  highlightColor: Colors.redAccent,
                  child: Text(
                    "Restart Pokedex from scratch.",
                    style: Theme.of(context).textTheme.display1,
                  ),
                  action: presenter.fromScratch,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

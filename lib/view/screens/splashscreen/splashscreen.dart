import 'package:Pokedex/misc/constants/app_constants.dart';
import 'package:Pokedex/misc/service_locator.dart';
import 'package:Pokedex/navigators/app_navigator/app_navigator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    loadAppData();
  }

  loadAppData() async {
    await Future.delayed(Duration(seconds: 3));
    AppNavigator navigator = locator<AppNavigator>();
    await Firebase.initializeApp();
    navigator.toAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: MediaQuery.of(context).size.height * 0.25,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Image.asset(
                AppConstants.IMAGES_ASSETS_PATH + "pokeball-logo.gif")),
      ),
    );
  }
}

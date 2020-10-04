import 'package:Pokedex/controller/authentication/authentication_controller.dart';
import 'package:Pokedex/controller/authentication/firebase/google_firebase_authentication_controller.dart';
import 'package:Pokedex/misc/constants/app_constants.dart';
import 'package:Pokedex/misc/service_locator.dart';
import 'package:Pokedex/navigators/app_navigator/app_navigator.dart';
import 'package:Pokedex/view/components/buttons/primary_button.dart';
import 'package:Pokedex/view/screens/authentication/components/animated_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthHomeScreen extends StatefulWidget {
  AuthHomeScreen();

  @override
  _AuthHomeScreenState createState() => _AuthHomeScreenState();
}

class _AuthHomeScreenState extends State<AuthHomeScreen> {
  bool _displayButton = false;

  AppNavigator _appNavigator = locator<AppNavigator>();
  AuthenticationController _authController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Image.asset(
              AppConstants.IMAGES_ASSETS_PATH + "proffessor_oak.png",
              fit: BoxFit.contain,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Center(
              child: AnimatedText(
                texts: [
                  "Hello! \n My name is Professor Oak, \n What's your name?"
                ],
                onFinished: () {
                  setState(() {
                    _displayButton = true;
                  });
                },
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: _displayButton
                ? Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Row(
                      children: [
                        Container(
                          width: 25,
                          child: Icon(
                            FontAwesomeIcons.angleRight,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: _buildAuthButton("Let Google find out",
                                Colors.black, Colors.white, () {
                              _authController = AuthenticationController(
                                  GoogleFirebaseAuthenticationController());
                              _authController.process();
                            }, context),
                          ),
                        ),
                        Container(
                          width: 25,
                          child: Icon(
                            FontAwesomeIcons.angleLeft,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    width: 120,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildAuthButton(String buttonAltText, Color buttonColor,
      Color textColor, Function action, BuildContext context) {
    return PrimaryButton(
      action: action,
      //padding: EdgeInsets.symmetric(vertical: 14),
      child: Text(
        buttonAltText,
        style: Theme.of(context).textTheme.display1.copyWith(color: textColor),
      ),
      color: buttonColor,
    );
  }
}

import 'package:Pokedex/navigators/settings_navigator/settings_routes.dart';
import 'package:Pokedex/view/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class SettingsNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> toSettings() {
    return _pushRoute(SettingsRoutes.settings, clearStack: true);
  }

  popScreen() {
    navigatorKey.currentState.pop();
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SettingsRoutes.settings:
        return MaterialPageRoute(builder: (context) => SettingsScreen());
    }
    return null;
  }

  Future<T> _pushRoute<T>(String routeName,
      {Object arguments, bool clearStack = false}) {
    if (clearStack) {
      return navigatorKey.currentState.pushNamedAndRemoveUntil<T>(
          routeName, (route) => false,
          arguments: arguments);
    } else {
      return navigatorKey.currentState
          .pushNamed<T>(routeName, arguments: arguments);
    }
  }
}

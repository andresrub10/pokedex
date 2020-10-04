import 'package:Pokedex/misc/service_locator.dart';
import 'package:Pokedex/navigators/game_navigator/game_navigator.dart';
import 'package:Pokedex/navigators/game_navigator/game_routes.dart';
import 'package:Pokedex/navigators/pokedex_navigator/pokedex_navigator.dart';
import 'package:Pokedex/navigators/pokedex_navigator/pokedex_routes.dart';
import 'package:Pokedex/navigators/settings_navigator/settings_navigator.dart';
import 'package:Pokedex/navigators/settings_navigator/settings_routes.dart';
import 'package:Pokedex/view/screens/dashboard/components/bottom_navigation.dart';
import 'package:Pokedex/view/screens/dashboard/pokedex_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum TabItem { POKEDEX, GAME, SETTINGS }

class Dashboard extends StatefulWidget {
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TabItem _currentTab = TabItem.POKEDEX;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.POKEDEX: locator<PokedexNavigator>().navigatorKey,
    TabItem.GAME: locator<GameNavigator>().navigatorKey,
    TabItem.SETTINGS: locator<SettingsNavigator>().navigatorKey
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  PokedexPresenter _createPokedexPresenter() {
    return PokedexPresenter();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final isFirstRouteInCurrentTab =
              !await _navigatorKeys[_currentTab].currentState.maybePop();
          if (isFirstRouteInCurrentTab) {
            if (_currentTab != TabItem.GAME) {
              _selectTab(TabItem.GAME);
              return false;
            }
          }
          return isFirstRouteInCurrentTab;
        },
        child: ChangeNotifierProvider<PokedexPresenter>(
          create: (context) => _createPokedexPresenter()..onViewCreated(),
          child: Scaffold(
            body: Stack(children: <Widget>[
              _buildOffstageNavigator(TabItem.POKEDEX),
              _buildOffstageNavigator(TabItem.GAME),
              _buildOffstageNavigator(TabItem.SETTINGS)
            ]),
            bottomNavigationBar: BottomNavigation(
              currentTab: _currentTab,
              onSelectTab: _selectTab,
            ),
          ),
        ));
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.POKEDEX:
        return Offstage(
          offstage: _currentTab != tabItem,
          child: Navigator(
            key: locator<PokedexNavigator>().navigatorKey,
            initialRoute: PokedexRoutes.pokemonList,
            onGenerateRoute: locator<PokedexNavigator>().onGenerateRoute,
          ),
        );
        break;
      case TabItem.GAME:
        return Offstage(
          offstage: _currentTab != tabItem,
          child: Navigator(
            key: locator<GameNavigator>().navigatorKey,
            initialRoute: GameRoutes.game,
            onGenerateRoute: locator<GameNavigator>().onGenerateRoute,
          ),
        );
        break;
      case TabItem.SETTINGS:
        return Offstage(
          offstage: _currentTab != tabItem,
          child: Navigator(
            key: locator<SettingsNavigator>().navigatorKey,
            initialRoute: SettingsRoutes.settings,
            onGenerateRoute: locator<SettingsNavigator>().onGenerateRoute,
          ),
        );
      default:
        return Offstage(
          offstage: _currentTab != tabItem,
          child: Navigator(
            key: locator<GameNavigator>().navigatorKey,
            initialRoute: GameRoutes.game,
            onGenerateRoute: locator<GameNavigator>().onGenerateRoute,
          ),
        );
    }
  }
}

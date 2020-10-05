import 'package:Pokedex/view/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(
            tabItem: TabItem.POKEDEX,
            iconData: FontAwesomeIcons.book,
            context: context),
        _buildItem(
            tabItem: TabItem.GAME,
            iconData: FontAwesomeIcons.mapMarkedAlt,
            context: context),
        _buildItem(
            tabItem: TabItem.SETTINGS,
            iconData: FontAwesomeIcons.cog,
            context: context)
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem(
      {TabItem tabItem,
      IconData iconData,
      BuildContext context,
      String title}) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: _colorTabMatching(item: tabItem, context: context),
      ),
      title: Container(),
    );
  }

  Color _colorTabMatching({TabItem item, BuildContext context}) {
    return currentTab == item ? Theme.of(context).primaryColor : Colors.grey;
  }
}

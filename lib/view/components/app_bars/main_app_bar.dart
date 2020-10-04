import 'package:Pokedex/misc/logged_user_helper.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          LoggedUserHelper.getLoggedUser().givenName + "'s pokedex.",
          style: Theme.of(context).textTheme.title,
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

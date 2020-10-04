import 'package:flutter/material.dart';

class NavBarDot extends StatelessWidget {
  final bool active;

  const NavBarDot({@required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Theme.of(context).primaryColor : Colors.transparent,
      ),
    );
  }
}

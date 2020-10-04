import 'package:flutter/material.dart';

class PokemonDetailsBorderedSectionComponent extends StatelessWidget {
  double height;
  Widget child;
  String title;
  double borderWidth = 6;

  PokemonDetailsBorderedSectionComponent({this.height, this.child, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(
                color: Theme.of(context).primaryColor,
                width: borderWidth,
                style: BorderStyle.solid),
            left: BorderSide(
                color: Theme.of(context).primaryColor,
                width: borderWidth,
                style: BorderStyle.solid),
            right: BorderSide(
                color: Theme.of(context).primaryColor,
                width: borderWidth,
                style: BorderStyle.solid),
          )),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .display1
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(
                color: Theme.of(context).primaryColor,
                width: borderWidth,
                style: BorderStyle.solid),
          )),
          height: height,
          child: child,
        ),
      ],
    );
  }
}

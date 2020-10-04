import 'package:Pokedex/view/components/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class PrimaryButtonText extends StatelessWidget {
  final String text;
  final Function action;
  final Color color;
  final TextStyle textStyle;
  final EdgeInsets padding;

  const PrimaryButtonText(
      {this.text,
      this.action,
      this.color,
      this.textStyle,
      this.padding = const EdgeInsets.symmetric(vertical: 5)});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      padding: padding,
      action: action,
      color: color ?? Theme.of(context).primaryColor,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: textStyle ?? Theme.of(context).textTheme.button,
      ),
    );
  }
}

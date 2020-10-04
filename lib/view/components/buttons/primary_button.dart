import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final Function action;
  final Color color;
  final EdgeInsets padding;

  const PrimaryButton(
      {@required this.child,
      this.action,
      this.color,
      this.padding = const EdgeInsets.symmetric(vertical: 5)});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        padding: padding,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: action != null ? action : () {},
        color: color ?? Theme.of(context).buttonColor,
        child: child,
      ),
    );
  }
}

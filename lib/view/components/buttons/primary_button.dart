import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final Function action;
  final Color color;
  final Color highlightColor;
  final EdgeInsets padding;

  const PrimaryButton(
      {@required this.child,
      this.action,
      this.color,
      this.highlightColor,
      this.padding = const EdgeInsets.symmetric(vertical: 5)});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        padding: padding,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashColor: Colors.transparent,
        highlightColor: highlightColor,
        shape:
            PixelBorder(pixelSize: 3, borderRadius: BorderRadius.circular(12)),
        onPressed: action != null ? action : () {},
        color: color ?? Theme.of(context).buttonColor,
        child: child,
      ),
    );
  }
}

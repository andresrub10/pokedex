import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  Function onFinished;
  List<String> texts;

  AnimatedText({this.onFinished, this.texts});

  @override
  Widget build(BuildContext context) {
    return TypewriterAnimatedTextKit(
        speed: Duration(milliseconds: 70),
        totalRepeatCount: 1,
        repeatForever: false,
        isRepeatingAnimation: false,
        onFinished: onFinished,
        text: texts,
        textStyle: Theme.of(context).textTheme.title,
        textAlign: TextAlign.center,
        alignment: AlignmentDirectional.center);
  }
}

import 'package:flutter/material.dart';
import 'package:heritage/utilities/app_ui.dart';


class AppGradientText extends StatelessWidget {
  AppGradientText(
    this.text, {
    this.gradient,
    this.fontSize = 14,
    this.fontFamilly,
    this.height,
  });

  final String text;
  final Gradient gradient;
  final double fontSize;
  final double height;
  final String fontFamilly;

  @override
  Widget build(BuildContext context) {
    var _gradient = gradient ?? AppUi.yellowGradent;
    return ShaderMask(
      shaderCallback: (bounds) {
        return _gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          color: AppUi.yellowColor,
          fontFamily: fontFamilly ,
          fontWeight: FontWeight.bold,
          height: height,
          // foreground: Paint()
          //   ..shader = _gradient.createShader(
          //     (Rect.fromLTWH(0.0, 0.0, cons.maxWidth, cons.maxHeight)),
          //   ),
        ),
      ),
    );
  }
}

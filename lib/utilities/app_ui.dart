import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppUi {
//colors
  static const blackColor = Color(0xff1a1a1a);
  static const whiteColor = Color(0xffFAFAFA);
  static const yellowColor = Color(0xffe6d07a);

//fonts
  static const italianaFont = 'Italiana';
  static const reemKufiFont = 'ReemKufi';
  static const robotoFont = 'Roboto';
  static const cairoFont = 'Cairo';

//theme
  static final theme = ThemeData(
    scaffoldBackgroundColor: blackColor,
    primaryColor: blackColor,
    accentColor: yellowColor,
    fontFamily: robotoFont,
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: whiteColor,
        

      ),
    ),
  );

  //other
  static final yellowGradent = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      HSVColor.fromColor(yellowColor).withValue(1).toColor(),
      HSVColor.fromColor(yellowColor).withValue(0.5).toColor(),
    ],
  );
}

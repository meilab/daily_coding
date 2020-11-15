import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const Color background = Color(0xFFF2F3F8);
  // static const Color homeBackground = Color(0xFF75B7E1);
  static const Color homeBackground = Colors.white;
  static const Color cardBackground = Color(0xFFC7EAFF);

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);
  static const Color nearlyBlue = Color(0xFF00B6F0);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'WorkSans';

  static TextTheme textTheme = TextTheme(
    headline4: headline4(darkerText),
    headline5: headline5(darkerText),
    headline6: headline6(darkerText),
    subtitle2: subtitle2(darkText),
    bodyText1: bodyText1(darkText),
    bodyText2: bodyText2(darkText),
    caption: caption(lightText),
  );
  static TextTheme textThemeDark = TextTheme(
    headline4: headline4(white),
    headline5: headline5(white),
    headline6: headline6(white),
    subtitle2: subtitle2(nearlyWhite),
    bodyText1: bodyText1(nearlyWhite),
    bodyText2: bodyText2(nearlyWhite),
    caption: caption(notWhite),
  );

  static TextStyle Function(Color) headline4 = (Color color) => TextStyle(
        // h4 -> headline4
        fontFamily: fontName,
        fontWeight: FontWeight.bold,
        fontSize: 36,
        letterSpacing: 0.4,
        height: 0.9,
        color: color,
      );

  static TextStyle Function(Color) headline5 = (Color color) => TextStyle(
        // h5 -> headline5
        fontFamily: fontName,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        letterSpacing: 0.27,
        color: color,
      );

  static TextStyle Function(Color) headline6 = (Color color) => TextStyle(
        // h6 -> title
        fontFamily: fontName,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        letterSpacing: 0.18,
        color: color,
      );

  static TextStyle Function(Color) subtitle2 = (Color color) => TextStyle(
        // subtitle2 -> subtitle2
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        letterSpacing: -0.04,
        color: color,
      );

  static TextStyle Function(Color) bodyText1 = (Color color) => TextStyle(
        // bodyText2 -> bodyText1
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        letterSpacing: 0.2,
        color: color,
      );

  static TextStyle Function(Color) bodyText2 = (Color color) => TextStyle(
        // bodyText1 -> bodyText2
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        letterSpacing: -0.05,
        color: color,
      );

  static TextStyle Function(Color) caption = (Color color) => TextStyle(
        // Caption -> caption
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        letterSpacing: 0.2,
        color: color,
      );
}

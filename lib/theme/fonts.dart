import 'package:flutter/material.dart';
import 'package:daily_coding/theme/colors.dart';

// @flow

class FontType {
  static const String base = 'HelveticaNeue';
  static const String bold = 'HelveticaNeue-Bold';
  static const String emphasis = 'HelveticaNeue-Italic';
}

class FontSize {
  static const h1 = 38.0;
  static const h2 = 34.0;
  static const h3 = 30.0;
  static const h4 = 26.0;
  static const h5 = 20.0;
  static const h6 = 19.0;
  static const input = 18.0;
  static const regular = 17.0;
  static const medium = 14.0;
  static const small = 12.0;
  static const tiny = 8.5;
}

class HIconSizes {
  static const large = 56.0;
  static const medium = 24.0;
  static const normal = 18.0;
  static const small = 12.0;
}

class HFontSizes {
  static const huger = 30.0;
  static const huge = 26.0;
  static const large = 20.0;
  static const medium = 18.0;
  static const normal = 16.0;
  static const small = 14.0;
  static const smaller = 12.0;
  static const min = 10.0;
}

// const style = {
//   h1: {
//     fontFamily: type.base;
//     fontSize: size.h1
//   },
//   h2: {
//     fontWeight: 'bold',
//     fontSize: size.h2
//   },
//   h3: {
//     fontFamily: type.emphasis,
//     fontSize: size.h3
//   },
//   h4: {
//     fontFamily: type.base,
//     fontSize: size.h4
//   },
//   h5: {
//     fontFamily: type.base,
//     fontSize: size.h5
//   },
//   h6: {
//     fontFamily: type.emphasis,
//     fontSize: size.h6
//   },
//   normal: {
//     fontFamily: type.base,
//     fontSize: size.regular
//   },
//   description: {
//     fontFamily: type.base,
//     fontSize: size.medium
//   }
// }

class MyFonts {
  static const lagerTextSize = 30.0;
  static const bigTextSize = 26.0;
  static const normalTextSize = 20.0;
  static const middleTextWhiteSize = 18.0;
  static const smallTextSize = 16.0;
  static const minTextSize = 14.0;

  static const minText = TextStyle(
    color: Color(MyColors.subLightTextColor),
    fontSize: minTextSize,
  );

  static const smallTextWhite = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: smallTextSize,
  );

  static const smallText = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: smallTextSize,
  );

  static const smallTextBold = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: smallTextSize,
    fontWeight: FontWeight.bold,
  );

  static const smallSubLightText = TextStyle(
    color: Color(MyColors.subLightTextColor),
    fontSize: smallTextSize,
  );

  static const smallActionLightText = TextStyle(
    color: Color(MyColors.actionBlue),
    fontSize: smallTextSize,
  );

  static const smallMiLightText = TextStyle(
    color: Color(MyColors.miWhite),
    fontSize: smallTextSize,
  );

  static const smallSubText = TextStyle(
    color: Color(MyColors.subTextColor),
    fontSize: smallTextSize,
  );

  static const middleText = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: middleTextWhiteSize,
  );

  static const middleTextWhite = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: middleTextWhiteSize,
  );

  static const middleSubText = TextStyle(
    color: Color(MyColors.subTextColor),
    fontSize: middleTextWhiteSize,
  );

  static const middleSubLightText = TextStyle(
    color: Color(MyColors.subLightTextColor),
    fontSize: middleTextWhiteSize,
  );

  static const middleTextBold = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: middleTextWhiteSize,
    fontWeight: FontWeight.bold,
  );

  static const middleTextWhiteBold = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: middleTextWhiteSize,
    fontWeight: FontWeight.bold,
  );

  static const middleSubTextBold = TextStyle(
    color: Color(MyColors.subTextColor),
    fontSize: middleTextWhiteSize,
    fontWeight: FontWeight.bold,
  );

  static const normalText = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: normalTextSize,
  );

  static const normalTextBold = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );

  static const normalSubText = TextStyle(
    color: Color(MyColors.subTextColor),
    fontSize: normalTextSize,
  );

  static const normalTextWhite = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: normalTextSize,
  );

  static const normalTextMitWhiteBold = TextStyle(
    color: Color(MyColors.miWhite),
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );

  static const normalTextActionWhiteBold = TextStyle(
    color: Color(MyColors.actionBlue),
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );

  static const normalTextLight = TextStyle(
    color: Color(MyColors.primaryLightValue),
    fontSize: normalTextSize,
  );

  static const largeText = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: bigTextSize,
  );

  static const largeTextBold = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: bigTextSize,
    fontWeight: FontWeight.bold,
  );

  static const largeTextWhite = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: bigTextSize,
  );

  static const largeTextWhiteBold = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: bigTextSize,
    fontWeight: FontWeight.bold,
  );

  static const largeLargeTextWhite = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: lagerTextSize,
    fontWeight: FontWeight.bold,
  );

  static const largeLargeText = TextStyle(
    color: Color(MyColors.primaryValue),
    fontSize: lagerTextSize,
    fontWeight: FontWeight.bold,
  );
}

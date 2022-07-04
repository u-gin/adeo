import 'package:flutter/material.dart';

class   ColorSystem{

  static Color colorFromHex(String colorCode) {
    final hexCode = colorCode.replaceAll('#', '');
    Color newColor = Color(int.parse('FF$hexCode', radix: 16));
    return newColor;
  }

  static Color white = colorFromHex('#FFFFFF');
  static Color black = colorFromHex('#000000');
  static Color primary = colorFromHex('#00C664');
  static Color secondary = colorFromHex('#222E3B');
  static Color accent = colorFromHex('#66717D');
  static Color answerSectionColor = colorFromHex('#2D3E50');
  static Color answerTextColor = colorFromHex('#C0C5CB');
  static Color answerBoxBorderColor = colorFromHex('#00ABE0');
  static Color summaryScreenBackgroundColor = colorFromHex('#F6F6F6');
  static Color summaryButtonTextColor = colorFromHex('#A2A2A2');
  static Color scoreText = colorFromHex('#707070');
  static Color topicsBackgroundColor = colorFromHex('#2589CE');
  static Color questionsBackgroundColor = colorFromHex('#2A9CEA');
  static Color storeButtonColor = colorFromHex('#07C4FF');
  static Color homeButtonColor = colorFromHex('#FF8071');

}
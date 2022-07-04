import 'package:flutter/material.dart';

class ButtonTemplate extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final double buttonWidth;
  final Color fontColor;
  final double textSize;
  final Function buttonFunction;
  double? radius;

  ButtonTemplate({
    required this.buttonName,
    required this.buttonColor,
    required this.buttonWidth,
    required this.fontColor,
    required this.textSize,
    required this.buttonFunction,
    this.radius
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () => buttonFunction(),
        child: Text(
          buttonName,
          style: TextStyle(
            color: fontColor,
            fontSize: 16.0,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w500,
          ),
        ),
        color: buttonColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        elevation: 0,
        minWidth: buttonWidth,
        height: 50,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 2)
        ),
    );
  }
}
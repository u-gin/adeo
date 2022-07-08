import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproject/constants/colours.dart';



class AnswerTileTemplate extends StatefulWidget{

  late final String answer;
  late final bool isSelected;

  AnswerTileTemplate({required this.answer, required this.isSelected});

  @override
  _AnswerTileTemplateState createState() => _AnswerTileTemplateState();
}

class _AnswerTileTemplateState extends State<AnswerTileTemplate> {

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        width: width,
        height: widget.isSelected ? 60 : 40,
        decoration: BoxDecoration(
          color: widget.isSelected ? ColorSystem.secondary : Colors.transparent,
          shape: BoxShape.rectangle,
          border: Border.all(
            width: widget.isSelected ? 2.0 : 0.0,
            color: widget.isSelected ? ColorSystem.answerBoxBorderColor : Colors.transparent
          )
        ),
        child: Center(
          child: Text(
            widget.answer,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: widget.isSelected ? Colors.white : ColorSystem.answerTextColor,
              fontSize: widget.isSelected ? 28.0 : 20.0,
              fontWeight: FontWeight.w600
            ),
          ),
        )
      ),
    );
  }
}
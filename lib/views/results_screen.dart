import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproject/components/button_template.dart';
import 'package:testproject/constants/colours.dart';
import 'package:testproject/models/answered_questions.dart';
import 'package:testproject/models/questions.dart';
import 'package:testproject/views/summary_screen.dart';

import 'alert_screen.dart';



class ResultsScreen extends StatefulWidget{

  static const String routeName = 'results';

  int numberOfQuestions = 20;
  int? numberOfCorrects;
  List<Questions>? questionsList;
  List<AnsweredQuestions>? answeredQuestionsList;
  String? displayTime;

  ResultsScreen({this.numberOfCorrects, this.questionsList, this.answeredQuestionsList, this.displayTime});

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {

  bool switched = false;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    print(widget.displayTime);


    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: ColorSystem.summaryScreenBackgroundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40  ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  (((widget.numberOfCorrects) ?? 0 ) / widget.numberOfQuestions  * 100).floor().toString() + "%",
                                  style: TextStyle(
                                    color: ColorSystem.scoreText,
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),

                                SizedBox(
                                  height: 10,
                                ),

                                Text(
                                  "Score",
                                  style: TextStyle(
                                    color: ColorSystem.summaryButtonTextColor,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Text(
                                  "01:35",
                                  style: TextStyle(
                                    color: ColorSystem.scoreText,
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),

                                SizedBox(
                                  height: 10,
                                ),

                                Text(
                                  "Time taken",
                                  style: TextStyle(
                                    color: ColorSystem.summaryButtonTextColor,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Text(
                                  widget.numberOfQuestions.toString(),
                                  style: TextStyle(
                                    color: ColorSystem.scoreText,
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),

                                SizedBox(
                                  height: 10,
                                ),

                                Text(
                                  "Questions",
                                  style: TextStyle(
                                    color: ColorSystem.summaryButtonTextColor,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: width,
                          height: 3,
                          color: ColorSystem.white,
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40.0),
                                    bottomLeft: Radius.circular(40.0),
                                  ),
                                  color: ColorSystem.topicsBackgroundColor
                                ),
                                child: Center(
                                  child: Text(
                                    "Topics",
                                    style: TextStyle(
                                      color: ColorSystem.white,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ),
                              ),

                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                      MaterialPageRoute(
                                          builder: (context) => SummaryScreen(
                                            answeredQuestionsList: widget.answeredQuestionsList,
                                          )
                                      )
                                  );
                                  //Navigator.pushNamed(context, SummaryScreen.routeName);
                                },
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40.0),
                                      bottomRight: Radius.circular(40.0),
                                    ),
                                    color: ColorSystem.questionsBackgroundColor
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Questions",
                                      style: TextStyle(
                                        color: ColorSystem.white,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  child: Column(

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("%"),
                          Switch(
                            value: switched,
                            onChanged: (bool newValue){
                              setState(() {
                                switched = !switched;
                              });

                            },
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: ColorSystem.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "N/A",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        color: ColorSystem.black,
                                      ),
                                    ),

                                    SizedBox(
                                      height: 5.0,
                                    ),

                                    Text(
                                      performanceCalculator(widget.numberOfCorrects!),
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w300,
                                        color: ColorSystem.black,
                                        fontStyle: FontStyle.italic
                                      ),
                                    )
                                  ],
                                ),

                                switched ?
                                Text(
                                  (((widget.numberOfCorrects) ?? 0 ) / widget.numberOfQuestions  * 100).floor().toString() + "%",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: ColorSystem.questionsBackgroundColor,
                                  ),
                                )
                                    :
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: widget.numberOfCorrects.toString(),
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w700,
                                          color: ColorSystem.questionsBackgroundColor,
                                        ),
                                      ),

                                      TextSpan(
                                        text: "/" + widget.numberOfQuestions.toString(),
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400,
                                          color: ColorSystem.questionsBackgroundColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonTemplate(
                          buttonName: "review",
                          buttonColor: ColorSystem.white,
                          fontColor: ColorSystem.summaryButtonTextColor,
                          textSize: 15,
                          buttonWidth: 100,
                          buttonFunction: ()=> print(widget.numberOfCorrects),
                        ),

                        SizedBox(
                          width: 2,
                        ),

                        ButtonTemplate(
                          buttonName: "revise",
                          buttonColor: ColorSystem.white,
                          fontColor: ColorSystem.summaryButtonTextColor,
                          textSize: 15,
                          buttonWidth: 100,
                          buttonFunction: (){},
                        ),

                        SizedBox(
                          width: 2,
                        ),

                        ButtonTemplate(
                          buttonName: "new test",
                          buttonColor: ColorSystem.white,
                          fontColor: ColorSystem.summaryButtonTextColor,
                          textSize: 15,
                          buttonWidth: 100,
                          buttonFunction: (){
                            Navigator.pushNamed(context, AlertScreen.routeName);
                          },
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String performanceCalculator(int score){
    late String performance;
    if (score<=6) {
      performance = 'Poor performance';
    }

    if (score <= 10 && score >6) {
      performance = 'Average performance';
    }

    if (score <= 14 && score >10) {
      performance = 'Good performance';
    }

    if (score <= 20 && score >14) {
      performance = 'Excellent performance';
    }

    return performance;
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproject/constants/colours.dart';
import 'package:testproject/models/answered_questions.dart';

class SummaryScreen extends StatefulWidget{

  static const String routeName = 'summary';

  List<AnsweredQuestions>? answeredQuestionsList;

  SummaryScreen({this.answeredQuestionsList});

  List<AnsweredQuestions> correctlyAnswered = [];
  List<AnsweredQuestions> wronglyAnswered = [];
  List<AnsweredQuestions> notAttempted = [];
  List<AnsweredQuestions> allAnswered = [];

  List<AnsweredQuestions>? listToUse = [];


  SummaryScreen.name(){
     listToUse = answeredQuestionsList;
  }

  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  bool selected1 = true;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;


  @override
  void initState() {
    listCategorization();
    widget.listToUse = widget.answeredQuestionsList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorSystem.answerSectionColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          width: width,
          child: Column(
            children: [
              Container(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selected1 = true;
                          selected2 = false;
                          selected3 = false;
                          selected4 = false;
                          widget.listToUse = widget.allAnswered;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: selected1 ? ColorSystem.white : Colors.transparent,
                              width: 5,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'All',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: ColorSystem.scoreText,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selected2 = true;
                          selected1 = false;
                          selected3 = false;
                          selected4 = false;
                          widget.listToUse = widget.correctlyAnswered;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: selected2 ? ColorSystem.white : Colors.transparent,
                              width: 5,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              child: Image.asset(
                                'assets/icons/checkmark.png',
                              ),
                            ),

                            SizedBox(
                              width: 5.0,
                            ),

                            Text(
                              'Correctly \nAnswered',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: ColorSystem.scoreText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selected3 = true;
                          selected1 = false;
                          selected2 = false;
                          selected4 = false;
                          widget.listToUse = widget.wronglyAnswered;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: selected3 ? ColorSystem.white : Colors.transparent,
                              width: 5,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              child: Image.asset(
                                'assets/icons/wrong.png',
                              ),
                            ),

                            SizedBox(
                              width: 5.0,
                            ),

                            Text(
                              'Wrongly \nAnswered',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: ColorSystem.scoreText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selected4 = true;
                          selected1 = false;
                          selected2 = false;
                          selected3 = false;
                          widget.listToUse = widget.notAttempted;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: selected4 ? ColorSystem.white : Colors.transparent,
                              width: 5,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not \nAttempted',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: ColorSystem.scoreText,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ),

              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 30),
                  child: ListView.builder(
                    itemCount: widget.listToUse!.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap:(){

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                (index + 1).toString() + '.',
                                style: TextStyle(
                                  color: ColorSystem.summaryButtonTextColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              SizedBox(
                                width: 10.0,
                              ),

                              Expanded(
                                child: Container(
                                  width: width,
                                  decoration: BoxDecoration(
                                    color: ColorSystem.secondary,
                                    shape: BoxShape.rectangle,
                                    /*border: Border.all(
                                      width: 2.0,
                                      color: ColorSystem.answerBoxBorderColor,
                                    ),*/
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            widget.listToUse![index].question,
                                            key: UniqueKey(),
                                            style: TextStyle(
                                              color: ColorSystem.summaryButtonTextColor,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                        Container(
                                          height: 15,
                                          width: 15,
                                          child: widget.listToUse![index].answerMArk == 1 ?
                                          Image.asset('assets/icons/checkmark.png') : Image.asset('assets/icons/wrong.png')
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void listCategorization(){
    for (int i = 0; i< widget.answeredQuestionsList!.length; i++){

      widget.allAnswered.add(widget.answeredQuestionsList![i]);

      if (widget.answeredQuestionsList![i].answerMArk == 1) {
        widget.correctlyAnswered.add(widget.answeredQuestionsList![i]);
      }

      else if (widget.answeredQuestionsList![i].answerMArk == 0) {
        widget.wronglyAnswered.add(widget.answeredQuestionsList![i]);
      }

      else  {
        widget.notAttempted.add(widget.answeredQuestionsList![i]);
      }
    }
  }
  //0551839183
}
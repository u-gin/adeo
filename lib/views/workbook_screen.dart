import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:html/parser.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:testproject/components/button_template.dart';
import 'package:testproject/components/timer_shape.dart';
import 'package:testproject/constants/colours.dart';
import 'package:testproject/models/answered_questions.dart';
import 'package:testproject/models/questions.dart';
import 'package:testproject/providers/connectivity_provider.dart';
import 'package:testproject/providers/questions_provider.dart';
import 'package:testproject/views/results_screen.dart';

class WorkbookScreen extends StatefulWidget{

  static const String routeName = 'workbook';

  @override
  _WorkbookScreenState createState() => _WorkbookScreenState();
}

class _WorkbookScreenState extends State<WorkbookScreen> {

  int currentQuestionIndex = 0;

  bool isSelected = false;
  int? selectedIndex;

  int numberOfQuestions = 20;
  int numberOfCorrects = 0;
  String? displayTime;

  List<Questions> questionsList = [];

  List<Answer> answers = [];

  List<AnsweredQuestions> answeredQuestions = [];

  String question = '';
  late int answerMark;


  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isMilli = false;


  String _parseHtmlString(String? htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body!.text).documentElement!.text;

    return parsedString;
  }

  void startStopWatch(){
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
  }

  void stopStopWatch(){
    _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
  }


  @override
  void initState() {
    //checkInternetAvailability();
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
    stopStopWatch();
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    questionsList = Provider.of<QuestionsProvider>(context).data;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          child: Consumer<ConnectivityProvider>(
            builder: (context, connected, child){

              if (connected.internetConnected == false) {
                return Container(
                  color: ColorSystem.accent,
                  child: AlertDialog(
                    backgroundColor: ColorSystem.secondary,
                    content: Text(
                      'Please check your internet connection and try again',
                      style: TextStyle(
                        color: ColorSystem.white,
                        fontSize: 13.0,
                      ),
                    ),

                    actions: [
                      TextButton(                     // FlatButton widget is used to make a text to work like a button
                        onPressed: () {
                          setState(() {

                          });
                        },             // function used to perform after pressing the button
                        child: Text(
                          'refresh',
                          style: TextStyle(
                            color: ColorSystem.primary
                          ),
                        ),
                      ),
                    ],

                  ),
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: width,
                        height: height*0.09,
                        color: ColorSystem.primary,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: height*0.09,
                          width: 70,
                          child: CustomPaint(
                            size: Size(
                              250,
                              (250*1.1666666666666667).toDouble(),
                            ),
                            painter: RPSCustomPainter(),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25.0, top: 25),
                              child: StreamBuilder<int>(
                                stream: _stopWatchTimer.rawTime,
                                initialData: _stopWatchTimer.rawTime.value,
                                builder: (context, snapshot){
                                  final value = snapshot.data;
                                  displayTime = StopWatchTimer.getDisplayTime(value!, hours: false, milliSecond: _isMilli);
                                  //print(displayTime);
                                  //print(value);
                                  return Text(
                                    displayTime!,
                                    style: TextStyle(
                                      color: ColorSystem.primary,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Consumer<QuestionsProvider>(
                    builder: (context, questionProvider, child){

                      return Container(
                          height: height*0.12,
                          width: width,
                          color: ColorSystem.secondary,
                          child:  Center(
                            child: Builder(
                              builder: (context){

                                if (questionProvider.isLoading || questionProvider.data.length == 0) {
                                  return Container(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      backgroundColor: ColorSystem.white,
                                      strokeWidth: 1,
                                    ),
                                  );
                                }

                                startStopWatch();

                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    _parseHtmlString(questionsList[currentQuestionIndex].text!),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                );

                              },


                            ),
                          )
                      );
                    },
                  ),

                  Container(
                    height: height*0.06,
                    width: width,
                    color: ColorSystem.accent,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Choose the right answer to the question above',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Container(
                      height: height,
                      color: ColorSystem.answerSectionColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Consumer<QuestionsProvider>(
                            builder: (context, questionsProvider, child){
                              if (questionsProvider.isLoading ) {
                                return Container(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    backgroundColor: ColorSystem.white,
                                    strokeWidth: 1,
                                  ),
                                );
                              }

                              return Container(
                                height: height*0.525,
                                child: ListView.builder(
                                  itemCount: questionsList[currentQuestionIndex].answers!.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index){
                                    return GestureDetector(
                                      key: UniqueKey(),
                                      onTap:(){
                                        selectedIndex = index;
                                        setState(() {
                                          isSelected = !isSelected;
                                        });
                                      },

                                      child: Padding(
                                        key: UniqueKey(),
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                                        child: Container(
                                          key: UniqueKey(),
                                          width: width,
                                          decoration: BoxDecoration(
                                            color: selectedIndex == index ? ColorSystem.secondary : Colors.transparent,
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              width: selectedIndex == index ? 2.0 : 0.0,
                                              color: selectedIndex == index ? ColorSystem.answerBoxBorderColor : Colors.transparent,
                                            ),
                                          ),
                                          child: Center(
                                            key: UniqueKey(),
                                            child: Text(
                                              _parseHtmlString(questionsList[currentQuestionIndex].answers![index].text),
                                              key: UniqueKey(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: selectedIndex == index ? Colors.white : ColorSystem.answerTextColor,
                                                fontSize: selectedIndex == index ? 22.0 : 20.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),


                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ButtonTemplate(
                                  buttonName: "Previous",
                                  buttonColor: ColorSystem.primary,
                                  buttonWidth: 150,
                                  fontColor: Colors.white,
                                  textSize: 15,
                                  buttonFunction: previousQuestion,
                                ),

                                SizedBox(
                                  width: 2,
                                ),

                                ButtonTemplate(
                                  buttonName: "Next",
                                  buttonColor: ColorSystem.primary,
                                  buttonWidth: 150,
                                  fontColor: Colors.white,
                                  textSize: 15,
                                  buttonFunction:() => nextQuestion(
                                    _parseHtmlString(questionsList[currentQuestionIndex].text),
                                    questionsList[currentQuestionIndex].answers!,
                                    selectedIndex,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                ],
              );
            },
          ),
        ),
      ),
    );

  }

  nextQuestion(String question, List<Answer> answers, int? index){

    if (selectedIndex == null) {
      answerMark = -1;
    }

    else if (answers[selectedIndex!].value == 1) {
      numberOfCorrects += 1;
      answerMark = 1;
    }

    else{
      answerMark = 0;
    }

    //add answered question, options nd selected option to the list of answered questions
    answeredQuestions.add(AnsweredQuestions(question: question, answerMArk: answerMark));

    if (currentQuestionIndex == numberOfQuestions-1) {

      stopStopWatch();

      //StopWatchTimer.getDisplayTime();
      Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(
            numberOfCorrects: numberOfCorrects,
            questionsList: questionsList,
            answeredQuestionsList: answeredQuestions,
            displayTime: displayTime,
          ),
        ),
      );
      //Navigator.pushNamed(context, ResultsScreen.routeName);
    }

    else{
      setState(() {
        selectedIndex = null;
        currentQuestionIndex += 1;
        //currentAnswersIndex += 1;
      });
    }

  }

  void previousQuestion(){
    if (currentQuestionIndex == 0) {
      return;
    }

    if (answeredQuestions.last.answerMArk == 1 ) {
      numberOfCorrects -= 1;
    }

    answeredQuestions.removeLast();

    setState(() {
      currentQuestionIndex -= 1;
      //currentAnswersIndex -= 1;
    });
  }

}
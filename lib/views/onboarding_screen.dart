/*
* this is the welcome screen
* appears once only for new users
*
* */


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproject/components/timer_shape.dart';
import 'package:testproject/constants/colours.dart';
import 'package:testproject/views/workbook_screen.dart';

class OnboardingScreen extends StatelessWidget{

  static const String routeName = 'onboarding';


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            color: ColorSystem.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to the \nAdeo Experience',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "You currently have \n",
                      ),

                      TextSpan(
                          text: "NO",
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          )
                      ),

                      TextSpan(
                        text: " subscription",
                      ),
                    ]
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Text(
                  'First take a diagnostic test \n to determine the right course \n for you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                Container(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, WorkbookScreen.routeName);
                    },
                    child: Text(
                      "Let's go",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        side: BorderSide(
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 50.0)
                    ),
                  ),
                )
              ],
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, WorkbookScreen.routeName);
              },
              child: Container(
                height: 60,
                width: 70,
                child: CustomPaint(
                  size: Size(
                    250,
                    (250*1.1666666666666667).toDouble(),
                  ),
                  painter: RPSCustomPainter(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 25),
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: ColorSystem.primary,
                        fontSize: 13,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
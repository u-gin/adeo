import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproject/components/button_template.dart';
import 'package:testproject/constants/colours.dart';

class AlertScreen extends StatelessWidget{

  static const String routeName  = 'alert';

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorSystem.secondary,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 150.0, horizontal: 20),
        child: Container(
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'This was a free diagnostic test',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  color: ColorSystem.white,
                ),
              ),

              SizedBox(
                height: 15,
              ),

              Text(
                'Buy a subscription to unlock the entire course',
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w300,
                  color: ColorSystem.scoreText,
                  fontStyle: FontStyle.italic
                ),
              ),

              SizedBox(
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonTemplate(
                    buttonName: "Store",
                    buttonColor: ColorSystem.storeButtonColor,
                    fontColor: ColorSystem.white,
                    textSize: 15,
                    buttonWidth: 150,
                    radius: 5,
                    buttonFunction: (){

                    },
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  ButtonTemplate(
                    buttonName: "Home",
                    buttonColor: ColorSystem.homeButtonColor,
                    fontColor: ColorSystem.white,
                    textSize: 15,
                    buttonWidth: 150,
                    radius: 5,
                    buttonFunction: (){

                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
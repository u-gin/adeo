import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.9946000,size.height*0.7876000);
    path0.cubicTo(size.width*1.0353000,size.height*1.0662000,size.width*0.8932000,size.height*1.0113000,size.width*0.1686000,size.height*0.9826000);
    path0.quadraticBezierTo(size.width*0.0180000,size.height*0.9861000,size.width*0.0400000,size.height*0.7700000);
    path0.lineTo(size.width*0.2436000,size.height*0.0011000);
    path0.lineTo(size.width*0.9976000,size.height*0.0024000);
    path0.quadraticBezierTo(size.width*1.0075000,size.height*0.1969000,size.width*0.9946000,size.height*0.7876000);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


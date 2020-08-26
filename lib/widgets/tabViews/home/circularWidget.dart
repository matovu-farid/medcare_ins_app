import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularWidget extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =
    Paint()
    ..color=Colors.amber
    ..strokeWidth = 5
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ;
    canvas.drawCircle(Offset(size.width/2,size.height/2), 35, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}
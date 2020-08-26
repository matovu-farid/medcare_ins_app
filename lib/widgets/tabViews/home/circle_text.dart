import 'package:flutter/material.dart';

import 'circularWidget.dart';

class CircleText extends StatelessWidget {
  final String text;
  final String title;
  const CircleText({
    Key key,this.text,this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: SizedBox(
        width: 150,
        height: 150,
        child: FittedBox(
          child: CustomPaint(
            painter: CircularWidget(),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Center(child: Text(text)),
            ),
          ),
        ),
      ),
    );
  }
}

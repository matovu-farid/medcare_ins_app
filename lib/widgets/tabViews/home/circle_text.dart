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
    return FractionallySizedBox(
      widthFactor: 0.8,
      heightFactor: 0.8,
      child: Card(
        elevation: 2,
        child: CustomPaint(
          painter: CircularWidget(),
          child: FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 0.5,
            child: Center(child: Text(text)),
          ),
        ),
      ),
    );
  }
}

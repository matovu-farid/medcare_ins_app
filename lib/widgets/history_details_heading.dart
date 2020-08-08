import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String text;
   Heading(this.text) ;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontWeight: FontWeight.bold),);
  }
}

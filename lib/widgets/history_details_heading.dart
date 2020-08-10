
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String text;

  Heading(this.text);

  @override
  Widget build(BuildContext context) {
    return Card(

      color: Colors.yellow,
      child: ListTile(
        title: Center(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}

class Content extends StatelessWidget {
  final String text;
  String position;

  Content(this.text,[this.position='O']);
  Color color(){
    return (position=='O')?Colors.blue[400]:Colors.blue[200];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color(),
        child: ListTile(
      title: Center(child: Text(text,style: TextStyle(color: Colors.white),)),
      contentPadding: EdgeInsets.zero,
    ));
  }
}

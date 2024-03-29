
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';


class Heading extends StatelessWidget {
  final String text;

  Heading(this.text);

  @override
  Widget build(BuildContext context) {
    return Card(

      color: Colors.yellow,
      child: ListTile(
        dense: true,
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
    return ListTile(
      dense: true,
      title: Center(child: Text(text,style: TextStyle(fontWeight: FontWeight.bold),)),
      contentPadding: EdgeInsets.zero,
    );
  }
}

class PWHeading extends pw.StatelessWidget {
  final String text;

  PWHeading(this.text);

  @override
  pw.Widget build(pw.Context context) {
    int color  = Colors.black.value;

    return  pw.Text(
      text,
      style: pw.TextStyle(
        decoration: pw.TextDecoration.underline,
          fontWeight: pw.FontWeight.bold,
          color: PdfColor.fromInt(color)),
    )

    ;
  }
}


class PWContent extends pw.StatelessWidget {
  final String text;


  PWContent(this.text);

  @override
  pw.Widget build(pw.Context context) {


    return pw.Text(text,style: pw.TextStyle(fontWeight: pw.FontWeight.normal));
  }
}

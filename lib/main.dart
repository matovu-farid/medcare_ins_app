import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalApp/gloabal_functions/randomnumber.dart';

import 'package:medicalApp/views/home.dart';
main(){

  runApp(MedCareApp());
}

class MedCareApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    
    
    
    return MaterialApp(

      routes: {
        '/':(_)=>Home(),
      },
      initialRoute: '/',


      );
  }

}
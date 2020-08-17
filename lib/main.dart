
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalApp/medical_model.dart';

import 'package:medicalApp/views/home.dart';
import 'package:scoped_model/scoped_model.dart';

import 'widgets/Login/LoginView.dart';
main(){

  runApp(MedCareApp());
}

class MedCareApp extends StatelessWidget{
 final MedicalModel model =MedicalModel();

// MedCareApp({Key key,this.model}):super(key:key);

 @override
  Widget build(BuildContext context) {
    
    
    
    return ScopedModel<MedicalModel>(
      model: model,
      child: MaterialApp(
        routes: {
          '/':(_)=>Home(),
          '/Login':(_)=>Login()
        },
        initialRoute: '/',


        ),
    );
  }

}
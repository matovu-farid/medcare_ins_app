
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicalApp/medical_model.dart';

import 'package:medicalApp/views/Home.dart';
import 'package:scoped_model/scoped_model.dart';

import 'views/Login/LoginView.dart';


main(){
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });


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
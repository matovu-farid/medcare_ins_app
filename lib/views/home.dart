import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalApp/gloabal_functions/genClient.dart';
import 'package:medicalApp/gloabal_functions/genHistory.dart';
import 'package:medicalApp/gloabal_functions/genUserProfile.dart';
import 'package:medicalApp/gloabal_functions/genBenefits.dart';
import 'package:medicalApp/gloabal_functions/randomnumber.dart';
import 'package:mock_data/mock_data.dart';


class Home extends StatelessWidget {


  List<String> names = ['farid','jane','joe','steve'];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("MedCare"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: ListView.builder(
            //itemCount: listOfClients.length,
            itemCount: names.length,
              itemBuilder: (_,index){
              //String patientName= listOfClients[index].history.patientInfo.patientName;
                //names[index]} ${generateClientList()[0].history.patientInfo.patientName
            return ListTile(title: Text('${names[index]} ${generateClientList()[index].toString()}'));
          }),
        ),
      ),
    );
  }
}

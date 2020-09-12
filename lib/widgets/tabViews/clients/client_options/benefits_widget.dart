import 'package:flutter/material.dart';
import 'package:medicalApp/models/clients/myclient.dart';

import '../components/history_details_heading.dart';

class BenefitsListView extends StatelessWidget {
  final MyClient client;

  BenefitsListView(this.client);

  List<Widget> listOfInPatientBenefits(){
    List<Widget> benefitsWidgets = [];
    client.allBenefits['inPatientBenefits'].forEach((key, value) {
      if(value != 0 || value !='0')
      benefitsWidgets.add(Content('$key : $value'));
    });

    return benefitsWidgets;

  }

  List<Widget> listOfOutPatientBenefits(){
    List<Widget> benefitsWidgets = [];
    client.allBenefits['outPatientBenefits'].forEach((key, value) {
      if(value != 0 || value !='0')
      benefitsWidgets.add(Content('$key : $value'));
    });

    return benefitsWidgets;

  }



  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [

        Heading('InPatient Benefits'),
        ListView(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          children:
          listOfInPatientBenefits()
          ,
        ),
//        if(!client.isGenerated)
        Heading('OutPatient Benefits'),

      ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children:
          listOfOutPatientBenefits()
        ,
      )
      ],
    );
  }
}

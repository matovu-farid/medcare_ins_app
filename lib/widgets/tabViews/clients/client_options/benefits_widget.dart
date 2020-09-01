import 'package:flutter/material.dart';
import 'package:medicalApp/models/clients/client.dart';

import '../components/history_details_heading.dart';

class BenefitsListView extends StatelessWidget {
  final MyClient client;

  BenefitsListView(this.client);

  List<Map<String, dynamic>> listOfBenefits() =>
      client.benefits.toList();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        Heading('Benefits'),
        if(client.isGenerated)
        ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: listOfBenefits().length,
          itemBuilder: (_, index) {
            String color(){
              return (index%2==0)?'O':'E';
            }
            return Content(
                '${listOfBenefits()[index].keys.first} : ${listOfBenefits()[index][listOfBenefits()[index].keys.first]}',color());
          },
        ),
        if(!client.isGenerated)
          ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: client.allBenefits['inPatientBenefits'].length,
            itemBuilder: (_, index) {
              String color(){
                return (index%2==0)?'O':'E';
              }
              return Column(
                children: [
                  Text('InPatient Benefits'),
                  Content(
                      '${client.allBenefits['inPatientBenefits'][index].keys.first} : ${client.allBenefits['inPatientBenefits'][index][client.allBenefits['inPatientBenefits'][index].keys.first]}',color()),
                ],
              );
            },
          ),
        if(!client.isGenerated)
          ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: client.allBenefits['outPatientBenefits'].length,
            itemBuilder: (_, index) {
              String color(){
                return (index%2==0)?'O':'E';
              }
              return Column(
                children: [
                  Text('OutPatient Benefits'),
                  Content(
                      '${client.allBenefits['outPatientBenefits'][index].keys.first} : ${client.allBenefits['outPatientBenefits'][index][client.allBenefits['outPatientBenefits'][index].keys.first]}',color()),
                ],
              );
            },
          ),
      ],
    );
  }
}

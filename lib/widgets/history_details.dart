import 'dart:html';
import 'package:medicalApp/widgets/history_details_heading.dart';

import 'package:flutter/material.dart';
import 'package:medicalApp/gloabal_functions/genClient.dart';
import 'package:medicalApp/models/client.dart';

class HistoryDetails extends StatelessWidget {
  Client client = generateClientList()[0];
  List<Map<String, int>> listOfHospitalServices() =>
      client.history.medicalInfo.hospitalServices;
  List<Map<String, int>> listOfDrugs() =>
      client.history.medicalInfo.drugsPrescribed;
  List<Map<String, String>> listOfResults() =>
      client.history.medicalInfo.results;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Heading('Patient Information'),
        Text('Patient Name : ' + client.history.patientInfo.patientName),
        Text('Gender : ' + client.history.patientInfo.gender),
        Text('RelationShip : ' + client.history.patientInfo.relationship),
        Text('DOB : ' + client.history.patientInfo.dateOfBirth),
        Text('Medical CardNo : ' + client.history.patientInfo.medicalCardNo),
        Text('Medical Information'),
        Text(
            'Nature of Illness : ${client.history.medicalInfo.natureOfillness}'),
        Text('Diagnosis : ${client.history.medicalInfo.diagnosis}'),
        Text('Condition : ${client.history.medicalInfo.condition}'),
        Text('Consultation Fee: ${client.history.medicalInfo.consultationFee}'),
        SizedBox(
          height: 10,
        ),
        Heading('HospitalServices'),
        ListView.builder(
          shrinkWrap: true,
          itemCount: listOfHospitalServices().length,
          itemBuilder: (_, index) {
            return Text(
                '${listOfHospitalServices()[index].keys.first} : ${listOfHospitalServices()[index][listOfHospitalServices()[index].keys.first]},000 UGX');
          },
        ),
        SizedBox(
          height: 10,
        ),
        Heading('Drugs Precribed'),
        ListView.builder(
          shrinkWrap: true,
          itemCount: listOfHospitalServices().length,
          itemBuilder: (_, index) {
            return Text(
                '${listOfDrugs()[index].keys.first} : ${listOfDrugs()[index][listOfDrugs()[index].keys.first]},000 UGX');
          },
        ),
        SizedBox(
          height: 10,
        ),
        Heading('Results form Hospital'),
        ListView.builder(
          shrinkWrap: true,
          itemCount: listOfResults().length,
          itemBuilder: (_, index) {
            return Text(
                '${listOfResults()[index].keys.first} : ${listOfResults()[index][listOfResults()[index].keys.first]}');
          },
        ),
        SizedBox(
          height: 10,
        ),
        Heading('Clarification '),
        Text('Doctor\'s Name : ${client.history.clarification.doctorsName}'),
        Text(
            'Qualification : ${client.history.clarification.doctorsQualification}')
      ],
    );
  }
}

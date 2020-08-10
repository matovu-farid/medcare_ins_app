
import 'package:flutter/material.dart';
import 'package:medicalApp/gloabal_functions/genClient.dart';
import 'package:medicalApp/models/client.dart';

import 'components/history_details_heading.dart';


class HistoryDetails extends StatelessWidget {
  final Client client = generateClientList()[0];

  List<Map<String, int>> listOfHospitalServices() =>
      client.history.medicalInfo.hospitalServices;

  List<Map<String, int>> listOfDrugs() =>
      client.history.medicalInfo.drugsPrescribed;

  List<Map<String, String>> clarificationList() =>
      client.history.clarification.toList();

  List<Map<String, String>> listOfResults() =>
      client.history.medicalInfo.results;

  List<Map<String, String>> listOPatientInfo() =>
      client.history.patientInfo.toList();


  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,

        children: [
      Heading('Patient Information'),
      ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: listOPatientInfo().length,
        itemBuilder: (_, index) {
          return Content(
              '${listOPatientInfo()[index].keys.first}: ${listOPatientInfo()[index][listOPatientInfo()[index].keys.first]}');
        },
      ),
      SizedBox(
        height: 10,
      ),
      Heading('HospitalServices'),
      ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: listOfHospitalServices().length,
        itemBuilder: (_, index) {
          return Content(
              '${listOfHospitalServices()[index].keys.first} : ${listOfHospitalServices()[index][listOfHospitalServices()[index].keys.first]},000 UGX');
        },
      ),
      SizedBox(
        height: 10,
      ),
      Heading('Drugs Precribed'),
      ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: listOfDrugs().length,
        itemBuilder: (_, index) {
          String color() {
            return (index % 2 == 0) ? 'O' : 'E';
          }

          return Content(
              '${listOfDrugs()[index].keys.first} : ${listOfDrugs()[index][listOfDrugs()[index].keys.first]},000 UGX',
              color());
        },
      ),
      SizedBox(
        height: 10,
      ),
      Heading('Results form Hospital'),
      ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: listOfResults().length,
        itemBuilder: (_, index) {
          String color() {
            return (index % 2 == 0) ? 'O' : 'E';
          }

          return Content(
              '${listOfResults()[index].keys.first} : ${listOfResults()[index][listOfResults()[index].keys.first]}',
              color());
        },
      ),
      SizedBox(
        height: 10,
      ),
      Heading('Clarification '),
      ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: clarificationList().length,
        itemBuilder: (_, index) {
          String color() {
            return (index % 2 == 0) ? 'O' : 'E';
          }

          return Content(
              '${clarificationList()[index].keys.first} : ${clarificationList()[index][clarificationList()[index].keys.first]}',
              color());
        },
      ),
      SizedBox(
        height: 10,
      ),
    ]);
  }
}

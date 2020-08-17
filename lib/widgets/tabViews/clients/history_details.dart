
import 'package:flutter/material.dart';
import 'package:medicalApp/models/clients/client.dart';

import 'components/history_details_heading.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';



class HistoryDetails extends StatelessWidget {
  final List<Client> clientList;
  final Client client;


  HistoryDetails(this.clientList, this.client);

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

//Making the pdf
  final pdf = pw.Document();
  void makePdf(){
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pwContentMade(); // Center
        }));
  }

  // function used to make the body of the pdf
 pw.Widget pwContentMade(){

   return pw.ConstrainedBox(
      constraints: pw.BoxConstraints(
        maxWidth: 400,
      ),
      child: pw.ListView(


          children: [
            PWHeading('Patient Information'),
            pw.ListView.builder(

              itemCount: listOPatientInfo().length,
              itemBuilder: (_, index) {
                return PWContent(
                    '${listOPatientInfo()[index].keys.first}: ${listOPatientInfo()[index][listOPatientInfo()[index].keys.first]}');
              },
            ),
            pw.SizedBox(
              height: 10,
            ),
            PWHeading('HospitalServices'),
            pw.ListView.builder(
              itemCount: listOfHospitalServices().length,
              itemBuilder: (_, index) {
                return PWContent(
                    '${listOfHospitalServices()[index].keys.first} : ${listOfHospitalServices()[index][listOfHospitalServices()[index].keys.first]},000 UGX');
              },
            ),
            pw.SizedBox(
              height: 10,
            ),
            PWHeading('Drugs Prescribed'),
            pw.ListView.builder(

              itemCount: listOfDrugs().length,
              itemBuilder: (_, index) {
                String color() {
                  return (index % 2 == 0) ? 'O' : 'E';
                }

                return PWContent(
                    '${listOfDrugs()[index].keys.first} : ${listOfDrugs()[index][listOfDrugs()[index].keys.first]},000 UGX',
                    color());
              },
            ),
            pw.SizedBox(
              height: 10,
            ),
            PWHeading('Results form Hospital'),
            pw.ListView.builder(

              itemCount: listOfResults().length,
              itemBuilder: (_, index) {
                String color() {
                  return (index % 2 == 0) ? 'O' : 'E';
                }

                return PWContent(
                    '${listOfResults()[index].keys.first} : ${listOfResults()[index][listOfResults()[index].keys.first]}',
                    color());
              },
            ),
            pw.SizedBox(
              height: 10,
            ),
            PWHeading('Clarification '),
            pw.ListView.builder(

              itemCount: clarificationList().length,
              itemBuilder: (_, index) {
                String color() {
                  return (index % 2 == 0) ? 'O' : 'E';
                }

                return PWContent(
                    '${clarificationList()[index].keys.first} : ${clarificationList()[index][clarificationList()[index].keys.first]}',
                    color());
              },
            ),
            pw.SizedBox(
              height: 10,
            ),
          ]),
    );
  }






  @override
  Widget build(BuildContext context) {


    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 400,
      ),
      child: ListView(
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
        Heading('Drugs Prescribed'),
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
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:medicalApp/models/clients/client.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'history_details_heading.dart';
import 'package:universal_html/html.dart' as html;

class BuildPdf {
  var blob;
  final ByteData logoData;
  final ByteData dpData;
  final MyClient client;
  final Function listOfHospitalServices;
  final Function listOfDrugs;
  final Function clarificationList;
  final Function listOfResults;
  final Function listOPatientInfo;
  final String hospitalName;
  final MedicalModel model;

  BuildPdf({
     this.model,
    @required this.hospitalName,
    @required this.logoData,
    @required this.dpData,
    @required this.client,
    @required this.listOfHospitalServices,
    @required this.listOfDrugs,
    @required this.clarificationList,
    @required this.listOfResults,
    @required this.listOPatientInfo,
  });

  final pdf = pw.Document();

  pw.Widget pwContentMade() {
    return pw.ConstrainedBox(
      constraints: pw.BoxConstraints(
        maxWidth: 500,
      ),
      child: pw.Column(
          children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.SizedBox(
              width: 150,
              height: 150,
              child: pw.FittedBox(
                child:

                    pw.Image(PdfImage.file(
                      pdf.document,
                      bytes: logoData.buffer.asUint8List(),
                    )),


              ),
            ),

            pw.Text(
              hospitalName,
              style: pw.TextStyle(
                  fontSize: 25,
                color: PdfColor.fromInt(Colors.brown[700].value)
              ),

            )
          ],
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.all(8.0),
          child: pw.Align(
              alignment: pw.Alignment.topRight,
              child: pw.SizedBox(
                width: 120,
                height: 120,
                child: pw.FittedBox(
                  child: pw.Column(
                    children: [
                      if(client.isGenerated)
                      pw.Image(PdfImage.file(
                        pdf.document,
                        bytes: dpData.buffer.asUint8List(),
                      )),
                      if(!client.isGenerated)
                        pw.Image(

                            PdfImage.file(pdf.document,
                                bytes: model.imageBytes)
                        )
                    ],
                  ),
                ),
              )),
        ),

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
            return PWContent(
              '${listOfDrugs()[index].keys.first} : ${listOfDrugs()[index][listOfDrugs()[index].keys.first]},000 UGX',
            );
          },
        ),
        pw.SizedBox(
          height: 10,
        ),
//        PWHeading('Results form Hospital'),
//        pw.ListView.builder(
//          itemCount: listOfResults().length,
//          itemBuilder: (_, index) {
//            return PWContent(
//              '${listOfResults()[index].keys.first} : ${listOfResults()[index][listOfResults()[index].keys.first]}',
//            );
//          },
//        ),
        pw.SizedBox(
          height: 10,
        ),
        PWHeading('Clarification '),
        pw.ListView.builder(
          itemCount: clarificationList().length,
          itemBuilder: (_, index) {
            return PWContent(
              '${clarificationList()[index].keys.first} : ${clarificationList()[index][clarificationList()[index].keys.first]}',
            );
          },
        ),
        pw.SizedBox(
          height: 10,
        ),
      ]),
    );
  }

  void makePdf() {
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pwContentMade(); // Center
        }));
    var bytes = pdf.save();
    blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.window.open(url, "_blank");
    html.Url.revokeObjectUrl(url);
  }
  void downloadPdf(){
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pwContentMade(); // Center
        }));
    var bytes = pdf.save();
    blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor =
    html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'Patient Details.pdf';
    html.document.body.children.add(anchor);
    anchor.click();
    html.document.body.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  }
}

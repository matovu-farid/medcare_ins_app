import 'dart:typed_data';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:medicalApp/models/clients/myclient.dart';
import 'package:medicalApp/models/clients/history.dart';
import 'package:medicalApp/widgets/tabViews/clients/components/pdfBuild.dart';
import 'package:scoped_model/scoped_model.dart';
import '../components/history_details_heading.dart';
import 'package:pdf/widgets.dart' as pw;

class HistoryDetails extends StatefulWidget {

  final MyClient client;
  final UserHistory history;

  HistoryDetails( this.client,this.history);

  @override
  _HistoryDetailsState createState() => _HistoryDetailsState();
}

class _HistoryDetailsState extends State<HistoryDetails> {

  List<Map<String, int>> listOfHospitalServices() =>
      widget.history.medicalInfo.hospitalServices;

  List<Map<String, int>> listOfDrugs() =>
      widget.history.medicalInfo.drugsPrescribed;

  List<Map<String, String>> clarificationList() =>
      widget.history.clarification.toList();

  List<Map<String, String>> listOfResults() =>
      widget.history.medicalInfo.results;

  List<Map<String, String>> listOPatientInfo() =>
      widget.history.patientInfo.toList();

  var blob;

  ByteData dpData;
  ByteData logoData;
ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    rootBundle.load(widget.client.userProfile.imagePath)
      ..then((data) => setState(() => this.dpData = data));
    rootBundle.load(widget.history.iconPath)
      ..then((data) => setState(() => this.logoData = data));
    _scrollController = ScrollController();
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final pdf = pw.Document();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 400,
      ),
      child: DraggableScrollbar.rrect(
        controller: _scrollController,
        backgroundColor: Colors.grey,
        alwaysVisibleScrollThumb: true,

        child: ListView(
          controller: _scrollController,
            children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //save pdf
              ScopedModelDescendant<MedicalModel>(

                builder: (context, ____,model) {
                  return FlatButton(
                    color: Colors.amber,
                      onPressed: () {
                        rootBundle.load(widget.history.iconPath)
                          ..then((data) =>  this.logoData = data);
                        BuildPdf(
                          model:model,
                          hospitalName: widget.history.hospitalName,
                            logoData: logoData,
                            dpData: dpData,
                            client: widget.client,
                            listOfHospitalServices: listOfHospitalServices,
                            listOfDrugs: listOfDrugs,
                            clarificationList: clarificationList,
                            listOfResults: listOfResults,
                            listOPatientInfo: listOPatientInfo).makePdf();

                        //makePdf();
                        //imageBlob();
                      },
                      child: Text('save pdf',style: TextStyle(
                          color: Colors.white
                      ),));
                }
              ),
              //download pdf
              ScopedModelDescendant<MedicalModel>(

                builder: (context, ___,model) {
                  return FlatButton(
                      color: Colors.amber,
                      onPressed: () {
                        BuildPdf(
                            model:model,
                            hospitalName: widget.history.hospitalName,
                            logoData: logoData,
                            dpData: dpData,
                            client: widget.client,
                            listOfHospitalServices: listOfHospitalServices,
                            listOfDrugs: listOfDrugs,
                            clarificationList: clarificationList,
                            listOfResults: listOfResults,
                            listOPatientInfo: listOPatientInfo).downloadPdf();
                      },
                      child: Text('Download pdf',style: TextStyle(
                        color: Colors.white
                      ),));
                }
              ),
            ],
          ),
          Heading('Patient Information'),
          ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: listOPatientInfo().length,
            itemBuilder: (_, index) {
              return Content(
                  '${listOPatientInfo()[index].keys
                      .first}: ${listOPatientInfo()[index][listOPatientInfo()[index]
                      .keys.first]}');
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
                  '${listOfHospitalServices()[index].keys
                      .first} : ${listOfHospitalServices()[index][listOfHospitalServices()[index]
                      .keys.first]},000 UGX');
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
                  '${listOfDrugs()[index].keys
                      .first} : ${listOfDrugs()[index][listOfDrugs()[index].keys
                      .first]},000 UGX',
                  color());
            },
          ),
          SizedBox(
            height: 10,
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
                  '${clarificationList()[index].keys
                      .first} : ${clarificationList()[index][clarificationList()[index]
                      .keys.first]}',
                  color());
            },
          ),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}

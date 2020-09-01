import 'dart:typed_data';

import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/widgets/tabViews/registration_form/regestration_two_form/registration_page_two.dart';

import '../../../../medical_model.dart';
import 'components/farid_form_field.dart';

class RegistrationPageOne extends StatefulWidget {
  final PageController pageController;

  final GlobalKey<FormState> formKey;



  final MedicalModel model;
  Widget imageWidget;

  @override
  _RegistrationPageOneState createState() => _RegistrationPageOneState();

  RegistrationPageOne(this.formKey,
      {
      this.pageController,

      this.imageWidget, this.model});

  final inPatientBenefitsList = <List<Map<String,dynamic>>>[
    [{'Hospital accommodation': false}],
    [{'Theatre and surgical fees': false}],
    [{'Doctors’ and specialists’ fees': false}],
    [{'In-hospital pharmaceuticals and dressings': false}],
    [{'Surgically implanted prostheses': false}],
    [{'Intensive care': false}],
    [{'Diagnostic tests': false}],
  ];
  final outPatientBenefitsList = <List<Map<String,dynamic>>>[
    [{'Dental exams and treatment': false}],
    [{'Glasses and contact lenses': false}],
    [{'Physiotherapy and chiropractic treatment': false}],
    [{'Speech and occupational therapy': false}],
    [{'Hearing aids': false}],
    [{'Natural therapies, for example acupuncture or naturopathy': false}],
  ];
  final company = [
    {'NAME OF COMPANY':''},
    {'LOCATION':''}
  ];



  final membersDetails = [
    {'SURNAME': '','Description':'required'},//0
    {'FIRST NAMES': '','Description':'required'},//1
    {'DATE OF BIRTH': '','Description':'required'},//2
    {'AGE': '','Description':'required'},//3
    {'MARITAL STATUS': '','Description':'required'},//4
    {'OCCUPATION': '','Description':'required'},//5
    {'NIN': '','Description':'required'},//6
    {'POSTAL ADDRESS': ''},//7
    {'BLOOD GROUP': '','Description':'required'},//8
    {'HEIGHT': ''},//9
    {'WEIGHT': ''},//10
    {'RESIDENTIAL PHYSICAL ADDRESS': ''},//11
    {'ALLERGIES': ''},//12
    {'TELEPHONE NO/OFF': ''},//13
    {'EMAIL': '','Description':'email'},//14
    {'RES': ''},//15
    {'MOBILE': '','Description': 'Phone number'},//16
    {'REGESTRATION DATE': '','Description':'required'},//17
    {'GENDER': ''},//18
    {'HOLDER STATUS':'','Description':'required'}//19
  ];

}

class _RegistrationPageOneState extends State<RegistrationPageOne> {

  final datePicker = FaridFormField(
    isDate: true,
    text: 'Enter Date',
  );
  String _filePath;
  int _fileLength;
  String _fileString;
  Uint8List _imageUnit8list;

  pickImage() {
    FilePickerCross.pick(
      type: FileTypeCross.image,
    ).then((filePicker) => setState(() {
          _filePath = filePicker.path;
          _imageUnit8list = filePicker.toUint8List();
          widget.model.setImageBytes(filePicker.toUint8List());
          _fileLength = filePicker.toUint8List().lengthInBytes;
          _isImageStringSet = true;
          widget.model.setImageWidget(Image.memory(
            filePicker.toUint8List(),
          ));

          try {
            _fileString = filePicker.toString();


          } catch (e) {
            _fileString =
                'Not a text file. Showing base64.\n\n' + filePicker.toBase64();
          }
        }));

  }


   ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    listOfRows.add(TableCreated().createTableRow(listOfDependants));
    _scrollController = ScrollController();

  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  final listOfRows = <TableRow>[];
  final listOfDependants = <Dependant>[];
  bool _isImageStringSet = false;





  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 2,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: DraggableScrollbar.rrect(
                backgroundColor: Colors.green,
                alwaysVisibleScrollThumb: true,
                controller: _scrollController,
                child: ListView(
                  controller: _scrollController,
                  children: [
                    if (_isImageStringSet )
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            pickImage();
                          },
                          child: SizedBox(
                              width: 200,
                              height: 200,
                              child: FittedBox(
                                  child: widget.imageWidget)),
                        ),
                      ),
                    if (!_isImageStringSet )
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              pickImage();
                            });

                          },
                          child: Container(
                            width: 200,
                            height: 200,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'TAP TO ADD PHOTO',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Icon(LineAwesomeIcons.photo_video)
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(color: Colors.grey),
                          ),
                        ),
                      ),
                    Text(
                      'MEMBERSHIP APPLICATION FORM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    RegInputField(
                      labelText: widget.company[0].keys.first,
                      onSaved: (String newValue) {
                        widget.company[0]
                            [widget.company[0].keys.first] = newValue;
                      }, description: 'required',
                    ),
                    RegInputField(
                      labelText: widget.company[1].keys.first,
                      onSaved: (String newValue) {
                        widget.company[1]
                            [widget.company[1].keys.first] = newValue;
                      }, description: 'required',
                    ),
                    RegHeader(
                      text: 'MEMBER DETAILS',
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: GridView.count(
                        childAspectRatio: 5 / 1,
                        padding: EdgeInsets.all(0),
                        physics: ClampingScrollPhysics(),
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        shrinkWrap: true,
                        children: [
                          ...widget.membersDetails.map((map) => RegInputField(
                                labelText: map.keys.first,
                                onSaved: (String newValue) {
                                  map[map.keys.first] = newValue;
                                }, description: map['Description'],
                              ))
                        ],
                      ),
                    ),
                    RegHeader(
                      text:
                          'ENTER BELOW DETAILS OF THE ALL DEPENDANTS TO BE INCLUDED IN THE MEMBERSHIP APPLICATION',
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: FittedBox(
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: Table(
                                children: listOfRows,
                              ),
                            ),
                            FloatingActionButton(
                                child: Icon(LineAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    listOfRows.add(TableCreated().createTableRow(listOfDependants));
                                  });
                                })
                          ],
                        ),
                      ),
                    ),

                    AllBenefits(
                      widget.formKey,
                      company:widget.company,
                      inPatientBenefitsList: widget.inPatientBenefitsList,
                      outPatientBenefitsList: widget.outPatientBenefitsList,
                      membersDetails: widget.membersDetails,
                    )..imageWidget=widget.model.imageWidget,

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegInputField extends StatelessWidget {
  final String labelText;
  final FormFieldSetter<String> onSaved;
  final String description;

  const RegInputField({
    Key key,
    @required this.labelText,
    @required this.onSaved,
    @required this.description
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FaridFormField(
      description: description,
      onSaved: onSaved,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black)),
    );
  }
}

class RegHeader extends StatelessWidget {
  final String text;

  const RegHeader({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        decoration: BoxDecoration(color: Colors.green),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
class TableCreated{

  TableRow createTableRow(List<Dependant> listOfDependants) {
    final dependant = Dependant();

    final tableRow = TableRow(children: [
      TableCell(
          child: RegInputField(
            labelText: 'SURNAME',
            description: 'required',
            onSaved: (String newValue) {
              dependant.surname = newValue;
            },
          )),
      TableCell(
          child: RegInputField(
            labelText: 'FIRST NAME',
            description: 'required',
            onSaved: (String newValue) {
              dependant.firstNames = newValue;
            },
          )),
      TableCell(
          child: RegInputField(
            labelText: 'GENDER',
            onSaved: (String newValue) {
              dependant.gender = newValue;
            }, description: 'required',
          )),
      TableCell(
          child: RegInputField(
            labelText: 'DATE OF BIRTH',
            onSaved: (String newValue) {
              dependant.dateOfBirth = newValue;
            }, description: 'required',
          )),
      TableCell(
          child: RegInputField(
            labelText: 'BLOOD GROUP',
            onSaved: (String newValue) {
              dependant.bloodGroup = newValue;
            }, description: 'required',
          )),
      TableCell(
          child: RegInputField(
            labelText: 'ALLERGIES',
            onSaved: (String newValue) {
              dependant.allergies = newValue;
            }, description: 'required',
          )),
      TableCell(
          child: RegInputField(
            labelText: 'HEIGHT',
            onSaved: (String newValue) {
              dependant.height = newValue;
            }, description: 'required',
          )),
      TableCell(
          child: RegInputField(
            labelText: 'WEIGHT',
            onSaved: (String newValue) {
              dependant.weight = newValue;
            }, description: 'required',
          )),
    ]);

    listOfDependants.add(dependant);
    return tableRow;
  }
}

class Dependant {
  String surname;
  String firstNames;
  String gender;
  String dateOfBirth;
  String bloodGroup;
  String allergies;
  String height;
  String weight;
}

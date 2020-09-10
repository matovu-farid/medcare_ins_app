import 'dart:typed_data';

import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/fire_base/send_data.dart';
import 'package:medicalApp/gloabal_functions/generateClient/genHistory.dart';
import 'package:medicalApp/models/client_company_model/client_company_model.dart';
import 'package:medicalApp/models/clients/myclient.dart';
import 'package:medicalApp/models/clients/user_profile.dart';
import 'package:medicalApp/widgets/tabViews/registration_form/regestration_two_form/registration_page_two.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../../../medical_model.dart';
import 'components/farid_form_field.dart';

class ActualRegistrationPage extends StatefulWidget {
  final PageController pageController;


  final MedicalModel model;
  Widget imageWidget;

  @override
  _ActualRegistrationPageState createState() => _ActualRegistrationPageState();

  ActualRegistrationPage(
      {this.pageController, this.imageWidget, this.model});


}

class _ActualRegistrationPageState extends State<ActualRegistrationPage> {
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
  GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
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

  final AllBenefits benefits = AllBenefits();
  final DataProvider data = DataProvider();

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width: MediaQuery.of(context).size.width ,
        height: MediaQuery.of(context).size.height,
        child: FittedBox(
          child: Form(
            key: formKey,
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height,
                child: ScopedModelDescendant<MedicalModel>(
                  builder: (context, snapshot,model) {
                    return Scaffold(
                      persistentFooterButtons: [
                        Submit(
                          formKey: formKey,
                          company: data.company,
                          inPatientBenefitsList: benefits.inPatientBenefitsList,
                          outPatientBenefitsList: benefits.outPatientBenefitsList,
                          membersDetails: data.membersDetails,
                          imageWidget: model.imageWidget,
                          model: model,
                        )
                      ],

                      body: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          elevation: 2,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                              maxHeight: MediaQuery.of(context).size.height,
                            ),
                            child: DraggableScrollbar.rrect(
                              backgroundColor: Colors.grey,
                              alwaysVisibleScrollThumb: true,
                              controller: _scrollController,
                              child: ListView(
                                controller: _scrollController,
                                children: [
                                  if (_isImageStringSet)
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: GestureDetector(
                                        onTap: () {
                                          pickImage();
                                        },
                                        child: SizedBox(
                                            width: 200,
                                            height: 200,
                                            child: FittedBox(child: widget.imageWidget)),
                                      ),
                                    ),
                                  if (!_isImageStringSet)
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
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                  RegInputField(
                                    labelText: data.company[0].keys.first,
                                    onSaved: (String newValue) {
                                      data.company[0][data.company[0].keys.first] =
                                          newValue;
                                    },
                                    description: 'required',
                                  ),
                                  RegInputField(
                                    labelText: data.company[1].keys.first,
                                    onSaved: (String newValue) {
                                      data.company[1][data.company[1].keys.first] =
                                          newValue;
                                    },
                                    description: 'required',
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
                                        ...data.membersDetails.map((map) {
                                          return RegInputField(
                                            labelText: map.keys.first,
                                            onSaved: (String newValue) {
                                              map[map.keys.first] = newValue;
                                            },
                                            description: map['Description'],
                                          );
                                        }),
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
                                                  listOfRows.add(TableCreated()
                                                      .createTableRow(listOfDependants));
                                                });
                                              })
                                        ],
                                      ),
                                    ),
                                  ),

                                  AllBenefitsWidget(
                                    formKey,
                                    company: data.company,
                                    inPatientBenefitsList: benefits.inPatientBenefitsList,
                                    outPatientBenefitsList: benefits.outPatientBenefitsList,
                                    membersDetails: data.membersDetails,
                                  )..imageWidget = widget.model.imageWidget,

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class AllBenefits{
  final inPatientBenefitsList = <List<Map<String, dynamic>>>[
    [
      {'Hospital accommodation': false}
    ],
    [
      {'Theatre and surgical fees': false}
    ],
    [
      {'Doctors’ and specialists’ fees': false}
    ],
    [
      {'In-hospital pharmaceuticals and dressings': false}
    ],
    [
      {'Surgically implanted prostheses': false}
    ],
    [
      {'Intensive care': false}
    ],
    [
      {'Diagnostic tests': false}
    ],
  ];
  final outPatientBenefitsList = <List<Map<String, dynamic>>>[
    [
      {'Dental exams and treatment': false}
    ],
    [
      {'Glasses and contact lenses': false}
    ],
    [
      {'Physiotherapy and chiropractic treatment': false}
    ],
    [
      {'Speech and occupational therapy': false}
    ],
    [
      {'Hearing aids': false}
    ],
    [
      {'Natural therapies, for example acupuncture or naturopathy': false}
    ],
  ];
}
class DataProvider{


  final company = [
    {'NAME OF COMPANY': ''},
    {'LOCATION': ''}
  ];

  final membersDetails = [
    {'SURNAME': '', 'Description': 'required'}, //0
    {'FIRST NAMES': '', 'Description': 'required'}, //1
    {'DATE OF BIRTH': '', 'Description': 'required'}, //2
    {'AGE': '', 'Description': 'required'}, //3
    {'MARITAL STATUS': '', 'Description': 'required'}, //4
    {'OCCUPATION': '', 'Description': 'required'}, //5
    {'NIN': '', 'Description': 'required'}, //6
    {'POSTAL ADDRESS': ''}, //7
    {'BLOOD GROUP': '', 'Description': 'required'}, //8
    {'HEIGHT': ''}, //9
    {'WEIGHT': ''}, //10
    {'RESIDENTIAL PHYSICAL ADDRESS': ''}, //11
    {'ALLERGIES': ''}, //12
    {'TELEPHONE NO/OFF': ''}, //13
    {'EMAIL': '', 'Description': 'email'}, //14
    {'RES': ''}, //15
    {'MOBILE': '', 'Description': 'Phone number'}, //16
    {'REGESTRATION DATE': '', 'Description': 'required'}, //17
    {'GENDER': ''}, //18
    {'HOLDER STATUS': '', 'Description': 'required'} //19
  ];
}

class Submit extends StatelessWidget {
  const Submit({
    Key key,
    @required this.model,
    @required this.formKey,
    @required this.inPatientBenefitsList,
    @required this.outPatientBenefitsList,
    @required this.membersDetails,
    @required this.imageWidget,
    @required this.company,
  }) : super(key: key);
  final MedicalModel model;
  final Widget imageWidget;
  final GlobalKey<FormState> formKey;
  final List<List<Map<String, dynamic>>> inPatientBenefitsList;
  final List<List<Map<String, dynamic>>> outPatientBenefitsList;
  final List<Map<String, String>> membersDetails;
  final List<Map<String, String>> company;


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.yellow,
      onPressed: () {
        formKey.currentState.save();
        formKey.currentState.validate();
        MyClient client = MyClient(
          historyList: genHistoryList(),
          userProfile: UserProfile(
            holderStatus: membersDetails[19][membersDetails[19].keys.first],
            gender: membersDetails[18][membersDetails[18].keys.first],
            name: membersDetails[0][membersDetails[0].keys.first],
            dateOfBirth: membersDetails[2][membersDetails[2].keys.first],
            phoneNumber: membersDetails[16][membersDetails[16].keys.first],
            occupation: membersDetails[5][membersDetails[5].keys.first],
            bloodType: membersDetails[8][membersDetails[8].keys.first],
            address: membersDetails[7][membersDetails[7].keys.first],
            email: membersDetails[14][membersDetails[14].keys.first],
            regDate: membersDetails[17][membersDetails[17].keys.first],
            company: ClientCompany(
              companyName: company[0][company[0].keys.first],
              location: company[1][company[1].keys.first],
            ),
          )..imageWidget = imageWidget,
          isGenerated: false,
          allBenefits: {
            'outPatientBenefits': outPatientBenefitsList
                .where((listOfMaps) =>
                    listOfMaps.first[listOfMaps.first.keys.first] == true)
                .map((listOfMaps) => {
                      '${listOfMaps[0].keys.first}':
                          '${listOfMaps[1][listOfMaps[1].keys.first]}'
                    })
                .toList(),
            'inPatientBenefits': inPatientBenefitsList
                .where((listOfMaps) =>
                    listOfMaps.first[listOfMaps.first.keys.first] == true)
                .map((listOfMaps) => {
                      '${listOfMaps[0].keys.first}':
                          '${listOfMaps[1][listOfMaps[1].keys.first]}'
                    })
                .toList()
          },
        );
        model.addToClientList(client);
        SendToFireBase().sendClient(client);
      },
      label: Text(
        'Submit',
        style: TextStyle(
            fontSize: 26, color: Colors.white,),
      ),
    );
  }
}
class RegInputField extends StatelessWidget {
  final String labelText;
  final ValueChanged<String> onChanged;

  final String description;
  final bool isCollapsed;
  final InputDecoration decoration;
  final FormFieldSetter<String> onSaved;

  RegInputField(
      {this.labelText,
      this.onChanged,
      this.description,
      this.isCollapsed,
      this.decoration,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        child: TextFormField(
          onSaved: onSaved,
          onChanged: onChanged,
//          validator: MyValidator(description).validate,
        validator: MyValidator(description).validate,
          decoration: InputDecoration(
              border: OutlineInputBorder(gapPadding: 6),
              labelText: labelText,
              labelStyle: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}

class MyValidator {
  final String description;

  MyValidator(this.description);

  String validate(value) {
    switch (description) {
      case 'email':
        return MultiValidator(<FieldValidator>[
          MyEmailValidator(errorText: 'Enter a valid email'),
          RequiredValidator(errorText: 'This field is required')
        ]).call(value);
        break;
      case 'Phone number':
        return MultiValidator([
          PhoneValidator('Enter a valid Phone number'),
          RequiredValidator(errorText: 'This field is required'),
        ]).call(value);
        break;
      case 'required':
        return RequiredValidator(errorText: 'This field is required')
            .call(value);
        break;

      default:
        return null;
    }
  }
}

class MyEmailValidator extends TextFieldValidator {
  /// regex pattern to validate email inputs.
  final Pattern _emailPattern =
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";

  MyEmailValidator({@required String errorText}) : super(errorText);

  @override
  bool isValid(String value) => hasMatch(_emailPattern, value);
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

class TableCreated {
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
        },
        description: 'required',
      )),
      TableCell(
          child: RegInputField(
        labelText: 'DATE OF BIRTH',
        onSaved: (String newValue) {
          dependant.dateOfBirth = newValue;
        },
        description: 'required',
      )),
      TableCell(
          child: RegInputField(
        labelText: 'BLOOD GROUP',
        onSaved: (String newValue) {
          dependant.bloodGroup = newValue;
        },
        description: 'required',
      )),
      TableCell(
          child: RegInputField(
        labelText: 'ALLERGIES',
        onSaved: (String newValue) {
          dependant.allergies = newValue;
        },
        description: 'required',
      )),
      TableCell(
          child: RegInputField(
        labelText: 'HEIGHT',
        onSaved: (String newValue) {
          dependant.height = newValue;
        },
        description: 'required',
      )),
      TableCell(
          child: RegInputField(
        labelText: 'WEIGHT',
        onSaved: (String newValue) {
          dependant.weight = newValue;
        },
        description: 'required',
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

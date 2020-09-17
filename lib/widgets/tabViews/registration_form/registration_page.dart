import 'dart:typed_data';

import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/fire_base/send_data.dart';
import 'package:medicalApp/gloabal_functions/generateClient/genHistory.dart';
import 'package:medicalApp/models/client_company_model/client_company_model.dart';
import 'package:medicalApp/models/clients/benefits.dart';
import 'package:medicalApp/models/clients/myclient.dart';

import 'package:medicalApp/models/clients/user_profile.dart';
import 'package:medicalApp/widgets/tabViews/registration_form/regestration_one_form/components/farid_form_field.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../../medical_model.dart';
import 'benefits_signup/benefits_reg_form.dart';

class RegistrationPage extends StatefulWidget {
  final PageController pageController;


  Widget imageWidget;

  @override
  _RegistrationPageState createState() => _RegistrationPageState();

  RegistrationPage({this.pageController, this.imageWidget});
}

class _RegistrationPageState extends State<RegistrationPage> {
  ScrollController _scrollController;
  GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final AllBenefits benefits = AllBenefits();
  final DataProvider data = DataProvider();
  AllBenefitsWidget get benefitsWidget => AllBenefitsWidget(
    formKey,
    company: data.company,
    inPatientBenefitsList:
    benefits.inPatientBenefitsList,
    outPatientBenefitsList:
    benefits.outPatientBenefitsList,
    membersDetails: data.membersDetails,
  );

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MedicalModel>(
        builder: (context, snapshot, model)  {
          widget.imageWidget = model.imageWidget;
        return FittedBox(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: FittedBox(
              child: Form(
                key: formKey,
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height,
                    child: Scaffold(
                      persistentFooterButtons: [
                        Submit(
                          key: Key('submit'),
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
                                  PickImage(model,widget.imageWidget),
                                  CompanyWidget(data),
                                  MemberDetailsWidget(data),
                                  DependantWidget(),
                                  benefitsWidget..imageWidget=model.imageWidget
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}

class CompanyWidget extends StatelessWidget {
  final DataProvider data;

  CompanyWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'MEMBERSHIP APPLICATION FORM',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        RegInputField(
          labelText: data.company[0].keys.first,
          onSaved: (String newValue) {
            data.company[0]
            [data.company[0].keys.first] = newValue;
          },
          description: 'required',
        ),
        RegInputField(
          labelText: data.company[1].keys.first,
          onSaved: (String newValue) {
            data.company[1]
            [data.company[1].keys.first] = newValue;
          },
          description: 'required',
        ),
      ],
    );
  }
}

class DependantWidget extends StatefulWidget {

  @override
  _DependantWidgetState createState() => _DependantWidgetState();
}

class _DependantWidgetState extends State<DependantWidget> {
  final listOfRows = <TableRow>[];
  final listOfDependants = <Dependant>[];
@override
  void initState() {
    super.initState();
    listOfRows.add(TableCreated().createTableRow(listOfDependants));
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RegHeader(
          text:
          'ENTER BELOW DETAILS OF THE ALL DEPENDANTS TO BE INCLUDED IN THE MEMBERSHIP APPLICATION',
        ),
        SizedBox(
          width:
          MediaQuery.of(context).size.width * 0.7,
          child: FittedBox(
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context)
                      .size
                      .width *
                      0.65,
                  child: Table(
                    children: listOfRows,
                  ),
                ),
                FloatingActionButton(
                    child: Icon(LineAwesomeIcons.plus),
                    onPressed: () {
                      setState(() {
                        listOfRows.add(TableCreated()
                            .createTableRow(
                            listOfDependants));
                      });
                    })
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MemberDetailsWidget extends StatelessWidget {
  final DataProvider data;
  MemberDetailsWidget(this.data);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RegHeader(
          text: 'MEMBER DETAILS',
        ),
        SizedBox(
          width:
          MediaQuery.of(context).size.width * 0.7,
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
      ],
    );
  }
}

class AllBenefits {
  final inPatientBenefitsList = <Map<String, dynamic>>[
    {'illnessHospitalization': 0, 'isShown': false},   //0
    {'accidentalHospitalization': 0, 'isShown': false},//1
    {'iCU': 0, 'isShown': false},                      //2
    {'ambulanceServices': 0, 'isShown': false},        //3
    {'chronicsInPatient': 0, 'isShown': false},        //4
    {'gynecologicalSurvey': 0, 'isShown': false},      //5
    {'generalSurgery':0,'isShown':false},              //6
    {'maternity': 0, 'isShown': false},                //7
    {'funeral': 0, 'isShown': false},                  //8
  ];

  final outPatientBenefitsList = <Map<String, dynamic>>[
    {'outPatientGeneral': 0, 'isShown': false},  //0
    {'dental': 0, 'isShown': false},             //1
    {'optical': 0, 'isShown': false},            //2
    {'chronicsOutPatient': 0, 'isShown': false}, //3
    {'annualWellness': 0, 'isShown': false},     //4
  ];
}

class DataProvider{
  final company = [
    {'NAME OF COMPANY': ''},
    {'LOCATION': ''}
  ];

  final membersDetails = [
    {'FULL NAMES': '', 'Description': 'required'}, //0
   {'MOBILE NUMBER': '', 'Description': 'Phone number'},//1
    {'OCCUPATION': '', 'Description': 'required'},//2
      {'EMAIL': '', 'Description': 'email'},//3
  {'HOLDER STATUS': '', 'Description': 'required'},//4
  {'GENDER': ''},//5
  {'DATE OF BIRTH': '', 'Description': 'required'},//6
  {'RESIDENTIAL PHYSICAL ADDRESS': ''},//7
  {'REGISTRATION DATE': '', 'Description': 'required'},//8
  {'BLOOD GROUP': '', 'Description': 'required'},//9

  ];
}

class PickImage extends StatefulWidget{
  final MedicalModel model;
  final Widget imageWidget;

  PickImage(this.model,this.imageWidget);

  @override
  _PickImageState createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  String _filePath;
  int _fileLength;
  String _fileString;
  Uint8List _imageUnit8list;
  bool _isImageStringSet = false;

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

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  child: FittedBox(
                      child: widget.imageWidget)),
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
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.all(8.0),
                        child: Text(
                          'TAP TO ADD PHOTO',
                          style: TextStyle(
                              color: Colors.white),
                        ),
                      ),
                      Icon(LineAwesomeIcons.photo_video)
                    ],
                  ),
                ),
                decoration:
                BoxDecoration(color: Colors.grey),
              ),
            ),
          ),
      ],
    );
  }
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
  final List<Map<String, dynamic>> inPatientBenefitsList;
  final List<Map<String, dynamic>> outPatientBenefitsList;
  final List<Map<String, String>> membersDetails;
  final List<Map<String, String>> company;


  outPatientProperty(int index){
    return outPatientBenefitsList[index][outPatientBenefitsList[index].keys.first];
  }
 inPatientProperty(int index){
    return inPatientBenefitsList[index][inPatientBenefitsList[index].keys.first];
  }

  Map<String, dynamic> get inPatientBenefitsMap => InPatientBenefits(
      illnessHospitalization: inPatientProperty(0),
      accidentalHospitalization: inPatientProperty(1),
      iCU: inPatientProperty(2),
      ambulanceServices: inPatientProperty(3),
      chronicsInPatient: inPatientProperty(4),
      gynecologicalSurvey: inPatientProperty(5),
      generalSurvey: inPatientProperty(6),
      maternity: inPatientProperty(7),
      funeral: inPatientProperty(8),).toJson();


  Map<String, dynamic> get outPatientBenefitsMap=> OutPatientBenefits(
            outPatientGeneral: outPatientProperty(0),
            dental: outPatientProperty(1),
            optical: outPatientProperty(2),
            chronicsOutPatient: outPatientProperty(3),
            annualWellness: outPatientProperty(4),).toJson();

  String userProfileProperties(int index){
    return membersDetails[index][membersDetails[index].keys.first];
  }

  UserProfile get createUserProfile=>UserProfile(
      name: userProfileProperties(0),
      company:  companyGot,
      phoneNumber: userProfileProperties(1),
      occupation: userProfileProperties(2),
      email: userProfileProperties(3),
      holderStatus: userProfileProperties(4),
      gender: userProfileProperties(5),
      dateOfBirth: userProfileProperties(6),
      address: userProfileProperties(7),
      regDate: userProfileProperties(8),
      bloodType: userProfileProperties(9));

   ClientCompany get companyGot => ClientCompany(
  companyName: company[0][company[0].keys.first],
  location: company[1][company[1].keys.first],
  );
  MyClient createClient(){
    var client = MyClient(
      historyList: genHistoryList(),
      userProfile: createUserProfile,
      isGenerated: false,
      allBenefits: {
        'outPatientBenefits': outPatientBenefitsMap,
        'inPatientBenefits': inPatientBenefitsMap,
      },
    );
    return client;
  }


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.yellow,
      onPressed: () {
        formKey.currentState.save();
        //formKey.currentState.validate();
        MyClient client = createClient();
        SendToFireBase().sendClient(client);
        //adding image widget after sending to the database
        client.userProfile.imageWidget=imageWidget;
        model.addToClientList(client);

      },
      label: Text(
        'Submit',
        style: TextStyle(
          fontSize: 26,
          color: Colors.white,
        ),
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

class TableCreated {
  TableRow createTableRow(List<Dependant> listOfDependants) {
    final dependant = Dependant();


    final tableRow = TableRow(children: [
      TableCell(
          child: RegInputField(
            labelText: 'NAMES',
            description: 'not-required',
            onSaved: (String newValue) {
              dependant.names = newValue;
            },
          )),

      TableCell(
          child: RegInputField(
            labelText: 'GENDER',
            onSaved: (String newValue) {
              dependant.gender = newValue;
            },
            description: 'not-required',
          )),
      TableCell(
          child: RegInputField(
            labelText: 'DATE OF BIRTH',
            onSaved: (String newValue) {
              dependant.dateOfBirth = newValue;
            },
            description: 'not-required',
          )),
      TableCell(
          child: RegInputField(
            labelText: 'BLOOD GROUP',
            onSaved: (String newValue) {
              dependant.bloodGroup = newValue;
            },
            description: 'not-required',
          )),

    ]);

    listOfDependants.add(dependant);
    return tableRow;
  }
}

class Dependant {
  String names;
  String gender;
  String dateOfBirth;
  String bloodGroup;
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


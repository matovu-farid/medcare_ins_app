import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'components/farid_form_field.dart';

class RegistrationPageOne extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final List<Map<String, String>> nextOfKin;
     final List<Map<String, String>> membersDetails;
  final List<Map<String, String>> familyDocInfo;
  @override
  _RegistrationPageOneState createState() => _RegistrationPageOneState();

  RegistrationPageOne(this.formKey, {this.nextOfKin, this.membersDetails, this.familyDocInfo});
}

class _RegistrationPageOneState extends State<RegistrationPageOne> {
  final datePicker = FaridFormField(
    isDate: true,
    text: 'Enter Date',
  );




//
//  final membersDetails = [
//    {'SURNAME': ''},
//    {'FIRST NAMES': ''},
//    {'DATE OF BIRTH': ''},
//    {'AGE': ''},
//    {'MARITAL STATUS': ''},
//    {'OCCUPATION': ''},
//    {'OFFICE LOCATION': ''},
//    {'NIN': ''},
//    {'POSTAL ADDRESS': ''},
//    {'BLOOD GROUP':''},
//    {'HEIGHT': ''},
//    {'WEIGHT': ''},
//    {'RESIDENTIAL PHYSICAL ADDRESS': ''},
//    {'ALLERGIES': ''},
//    {'TELEPHONE NO/OFF': ''},
//    {'EMAIL': ''},
//    {'RES': ''},
//    {'MOBILE': ''},
//  ];
//
//final familyDocInfo = [
//    {'NAME': ''},
//    {'NAME OF CLINIC/HOSP': ''},
//    {'LOCATION': ''},
//    {'TEL MOBILE': ''},
//    {'TEL OFFICE': ''},
//
//  ];
//
//final nextOfKin = [
//    {'NAME': ''},
//    {'TEL #1': ''},
//    {'TEL #2': ''},
//    {'EMAIL': ''},
//    {'ADDRESS': ''},
//
//  ];
TableRow createTableRow(){

  final dependant = Dependant();

     final tableRow= TableRow(
            children: [
              TableCell(child: RegInputField( labelText :'SURNAME', onSaved: (String newValue) { dependant.surname = newValue; },)),
              TableCell(child: RegInputField(labelText :'FIRST NAME', onSaved: (String newValue) { dependant.firstNames = newValue; },)),
              TableCell(child: RegInputField(labelText :'GENDER', onSaved: (String newValue) { dependant.gender = newValue; },)),
              TableCell(child: RegInputField(labelText :'DATE OF BIRTH', onSaved: (String newValue) { dependant.dateOfBirth = newValue; },)),
              TableCell(child: RegInputField(labelText :'BLOOD GROUP', onSaved: (String newValue) { dependant.bloodGroup = newValue; },)),
              TableCell(child: RegInputField(labelText :'ALLERGIES', onSaved: (String newValue) { dependant.allergies = newValue; },)),
              TableCell(child: RegInputField(labelText :'HEIGHT', onSaved: (String newValue) { dependant.height = newValue; },)),
              TableCell(child: RegInputField(labelText :'WEIGHT', onSaved: (String newValue) { dependant.weight = newValue; },)),


            ]
        );

  listOfDependants.add(dependant);
  return tableRow;
}
@override
  void initState() {

    super.initState();
    listOfRows.add(createTableRow());
  }
final listOfRows =<TableRow>[

];
final listOfDependants = <Dependant>[];
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
              child: ListView(

                children: [
                  Text(
                    'MEMBERSHIP APPLICATION FORM',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  RegInputField(
                    labelText: 'NAME OF COMPANY',
                    onSaved: (String newValue) {

                    },
                  ),
                  RegHeader(
                    text: 'MEMBER DETAILS',
                  ),
                  SizedBox(

                    width: MediaQuery.of(context).size.width*0.7,
                    child: GridView.count(
                      childAspectRatio: 5/1,

                      padding: EdgeInsets.all(0),
                          crossAxisCount: 3,
                          crossAxisSpacing: 5,
                         mainAxisSpacing: 5,
                          shrinkWrap: true,
                          children: [
                            ...widget.membersDetails.map((map) => RegInputField(
                                  labelText: map.keys.first,
                                  onSaved: (String newValue) {
                                    map[map.keys.first] = newValue;

                                  },
                                ))
                          ],
                        ),
                  ),
                  RegHeader(
                    text: 'ENTER BELOW DETAILS OF THE ALL DEPENDANTS TO BE INCLUDED IN THE MEMBERSHIP APPLICATION',
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,

                    child:
                    FittedBox(
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
                              onPressed: (){

                            setState(() {
                              listOfRows.add(createTableRow());

                            });


                          })
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RegHeader(

                      text: 'FAMILY DOCTOR INFORMATION',
                    ),
                  ),
                   SizedBox(

                    width: MediaQuery.of(context).size.width*0.7,
                    child: GridView.count(
                      childAspectRatio: 5/1,
                      physics: ScrollPhysics(),
                      padding: EdgeInsets.all(0),
                          crossAxisCount: 3,
                          crossAxisSpacing: 5,
                         mainAxisSpacing: 5,
                          shrinkWrap: true,
                          children: [
                            ...widget.familyDocInfo.map((map) => RegInputField(
                                  labelText: map.keys.first,
                                  onSaved: (String newValue) {
                                    map[map.keys.first] = newValue;
                                  },
                                ))
                          ],
                        ),
                  ),
                  RegHeader(
                    text: 'NEXT OF KIN(CONTACT IN CASE OF EMERGENCY)',
                  ),

                  SizedBox(

                    width: MediaQuery.of(context).size.width*0.7,
                    child: GridView.count(
                      childAspectRatio: 5/1,
                      physics: ScrollPhysics(),
                      padding: EdgeInsets.all(0),
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      shrinkWrap: true,
                      children: [
                        ...widget.nextOfKin.map((map) => RegInputField(
                          labelText: map.keys.first,
                          onSaved: (String newValue) {
                            map[map.keys.first] = newValue;

                          },
                        ))
                      ],
                    ),
                  ),

                ],
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

  const RegInputField({
    Key key,
    @required this.labelText,
    @required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FaridFormField(
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

class Dependant{
   String surname;
   String firstNames;
   String gender;
   String dateOfBirth;
   String bloodGroup;
   String allergies;
   String height;
   String weight;


}
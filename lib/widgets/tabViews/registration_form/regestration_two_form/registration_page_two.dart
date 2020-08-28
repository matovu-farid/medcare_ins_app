import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalApp/widgets/tabViews/registration_form/regestration_one_form/registration_page_one.dart';

class RegistrationPageTwo extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<Map<String, bool>> inPatientBenefitsList;
  final List<Map<String, bool>> outPatientBenefitsList;
  final List<Map<String, String>> membersDetails;
  final List<Map<String, String>> familyDocInfo;
  final List<Map<String, String>> nextOfKin;

  RegistrationPageTwo(this.formKey, {this.inPatientBenefitsList, this.outPatientBenefitsList, this.membersDetails, this.nextOfKin, this.familyDocInfo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.8,

      child: FittedBox(
        child: SizedBox(
          height: 800,
          width: 700,
          child: ListView(
            children: [
              RegHeader(
                text: 'BENEFITS',
              ),
              GridView.count(

                crossAxisCount: 2,
                shrinkWrap: true,
                children: [InPatientBenefits(inPatientBenefitsList),
                  OutPatientBenefits(outPatientBenefitsList)],
              ),
              FlatButton(
                padding: EdgeInsets.all(10),
                onPressed: () {
                  formKey.currentState.save();
                  print('${membersDetails.first[membersDetails.first.keys.first]}');

                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Submit',
                    style: TextStyle(
                      fontSize: 26,
                        color: Colors.white,
                        backgroundColor: Colors.green
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InPatientBenefits extends StatefulWidget {
  final List<Map<String, bool>> inPatientBenefitsList;
  InPatientBenefits(this.inPatientBenefitsList);

  @override

  _InPatientBenefitsState createState() => _InPatientBenefitsState();
}

class _InPatientBenefitsState extends State<InPatientBenefits> {


//  final inPatientBenefitsList = [
//    {
//      'Hospital accommodation':
//          false
//    },
//    {'Theatre and surgical fees': false},
//    {'Doctors’ and specialists’ fees': false},
//    {'In-hospital pharmaceuticals and dressings': false},
//    {'Surgically implanted prostheses': false},
//    {'Intensive care': false},
//    {'Diagnostic tests': false},
//  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text('In Patient Benefits'),
        ...widget.inPatientBenefitsList.map((benefit) =>
            CheckboxListTile(
              title: Text(benefit.keys.first),
              value: benefit[benefit.keys.first],
              onChanged: (bool value) {
                setState(() {
                  benefit[benefit.keys.first] =value;
                });

              },)
        )
      ],
    );

  }
}

class OutPatientBenefits extends StatefulWidget {
  final List<Map<String, bool>> outPatientBenefitsList;
  OutPatientBenefits(this.outPatientBenefitsList);

  @override
  _OutPatientBenefitsState createState() => _OutPatientBenefitsState();
}

class _OutPatientBenefitsState extends State<OutPatientBenefits> {
//  final outPatientBenefitsList = [
//    {
//      'Dental exams and treatment':
//      false
//    },
//    {'Glasses and contact lenses': false},
//    {'Physiotherapy and chiropractic treatment': false},
//    {'Speech and occupational therapy': false},
//    {'Hearing aids': false},
//    {'Natural therapies, for example acupuncture or naturopathy': false},
//
//  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text('Out Patient Benefits'),
        ...widget.outPatientBenefitsList.map((benefit) =>
            CheckboxListTile(
              title: Text(benefit.keys.first),
              value: benefit[benefit.keys.first],
              onChanged: (bool value) {
                setState(() {
                  benefit[benefit.keys.first] =value;
                });

              },)
        )
      ],
    );

  }
}

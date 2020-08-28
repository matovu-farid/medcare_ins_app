import 'package:flutter/material.dart';
import 'package:medicalApp/widgets/tabViews/registration_form/regestration_one_form/registration_page_one.dart';
import 'package:medicalApp/widgets/tabViews/registration_form/regestration_two_form/registration_page_two.dart';

class RegistrationPage extends StatefulWidget {
  final inPatientBenefitsList = [
    {'Hospital accommodation': false},
    {'Theatre and surgical fees': false},
    {'Doctors’ and specialists’ fees': false},
    {'In-hospital pharmaceuticals and dressings': false},
    {'Surgically implanted prostheses': false},
    {'Intensive care': false},
    {'Diagnostic tests': false},
  ];
  final outPatientBenefitsList = [
    {'Dental exams and treatment': false},
    {'Glasses and contact lenses': false},
    {'Physiotherapy and chiropractic treatment': false},
    {'Speech and occupational therapy': false},
    {'Hearing aids': false},
    {'Natural therapies, for example acupuncture or naturopathy': false},
  ];
  final membersDetails = [
    {'SURNAME': ''},
    {'FIRST NAMES': ''},
    {'DATE OF BIRTH': ''},
    {'AGE': ''},
    {'MARITAL STATUS': ''},
    {'OCCUPATION': ''},
    {'OFFICE LOCATION': ''},
    {'NIN': ''},
    {'POSTAL ADDRESS': ''},
    {'BLOOD GROUP': ''},
    {'HEIGHT': ''},
    {'WEIGHT': ''},
    {'RESIDENTIAL PHYSICAL ADDRESS': ''},
    {'ALLERGIES': ''},
    {'TELEPHONE NO/OFF': ''},
    {'EMAIL': ''},
    {'RES': ''},
    {'MOBILE': ''},
  ];
  final familyDocInfo = [
    {'NAME': ''},
    {'NAME OF CLINIC/HOSP': ''},
    {'LOCATION': ''},
    {'TEL MOBILE': ''},
    {'TEL OFFICE': ''},
  ];
  final nextOfKin = [
    {'NAME': ''},
    {'TEL #1': ''},
    {'TEL #2': ''},
    {'EMAIL': ''},
    {'ADDRESS': ''},
  ];

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: PageView(
        children: [
          RegistrationPageOne(formKey,
              nextOfKin: widget.nextOfKin,
              membersDetails: widget.membersDetails,
              familyDocInfo: widget.familyDocInfo),
          RegistrationPageTwo(formKey,
              inPatientBenefitsList: widget.inPatientBenefitsList,
              outPatientBenefitsList: widget.outPatientBenefitsList,
              nextOfKin: widget.nextOfKin,
              membersDetails: widget.membersDetails,
              familyDocInfo: widget.familyDocInfo,
          )
        ],
      ),
    );
  }
}

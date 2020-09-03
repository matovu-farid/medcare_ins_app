import 'package:flutter/material.dart';
import 'package:medicalApp/widgets/tabViews/registration_form/regestration_one_form/registration_page_one.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../../medical_model.dart';

class RegistrationPage extends StatefulWidget {

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  Widget imageWidget;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MedicalModel>(builder: (context, child, model) {
        return ActualRegistrationPage(

    model: model,
        )..imageWidget = model.imageWidget;
      });
  }
}

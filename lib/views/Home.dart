import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalApp/fire_base/send_data.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:medicalApp/widgets/vertical_tabBar.dart';
import 'package:scoped_model/scoped_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        accentColor: Colors.yellow,
        primaryColor: Colors.green,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("MedCare"),
        ),
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: FittedBox(child: ScopedModelDescendant<MedicalModel>(
                builder: (context, snapshot, model) {
              // SendClient().sendAllClients(model);
              SendToFireBase().sendHospitals(model);
              SendToFireBase().sendInsuranceCo(model);

              return VerticalTabBar(model.clientList, model);
            }))),
      ),
    );
  }
}

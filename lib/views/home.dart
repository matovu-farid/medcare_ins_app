import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:medicalApp/models/client.dart';
import 'package:medicalApp/widgets/history_details.dart';
import 'package:medicalApp/widgets/user_card.dart';


import 'package:mock_data/mock_data.dart';

class Home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MedCare"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: UserCard(),
        ),
      ),
    );
  }
}

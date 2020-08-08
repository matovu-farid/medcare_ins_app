import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/gloabal_functions/genClient.dart';
import 'package:medicalApp/models/client.dart';
import 'package:medicalApp/widgets/user_tile.dart';
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
          child: UserListView(),
        ),
      ),
    );
  }
}

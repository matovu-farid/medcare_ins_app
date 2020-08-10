import 'package:flutter/material.dart';
import 'package:medicalApp/gloabal_functions/genClient.dart';
import 'package:medicalApp/models/client.dart';
class UserDetails extends StatelessWidget {
  Client client = generateClientList()[0];
  List<Map<String,String>> get  detailsList => client.userProfile.toList();
  @override
  Widget build(BuildContext context) {
    return ListView(

    );
  }
}

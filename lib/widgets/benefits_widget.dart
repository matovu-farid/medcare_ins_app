import 'package:flutter/material.dart';
import 'package:medicalApp/gloabal_functions/genClient.dart';
import 'package:medicalApp/models/client.dart';

import 'history_details_heading.dart';
class BenefitsListView extends StatelessWidget {
  Client client = generateClientList()[0];

  List<Map<String, dynamic>> listOfBenefits() =>
      client.benefits.toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Heading('Benefits'),
        ListView.builder(
          shrinkWrap: true,
          itemCount: listOfBenefits().length,
          itemBuilder: (_, index) {
            String color(){
              return (index%2==0)?'O':'E';
            }
            return Content(
                '${listOfBenefits()[index].keys.first} : ${listOfBenefits()[index][listOfBenefits()[index].keys.first]}',color());
          },
        ),
      ],
    );
  }
}

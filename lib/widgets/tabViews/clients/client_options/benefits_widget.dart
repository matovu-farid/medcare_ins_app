import 'package:flutter/material.dart';
import 'package:medicalApp/models/clients/client.dart';

import '../components/history_details_heading.dart';

class BenefitsListView extends StatelessWidget {
  final Clients client;

  BenefitsListView(this.client);

  List<Map<String, dynamic>> listOfBenefits() =>
      client.benefits.toList();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        Heading('Benefits'),
        ListView.builder(
          physics: ClampingScrollPhysics(),
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

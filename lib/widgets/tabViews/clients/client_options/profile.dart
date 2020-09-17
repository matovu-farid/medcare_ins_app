import 'package:flutter/material.dart';
import 'package:medicalApp/models/clients/myclient.dart';

import '../components/history_details_heading.dart';
class Profile extends StatelessWidget {
  final MyClient client ;

  Profile(this.client);

  List<Map<String,String>> get  detailsList => client.userProfile.toList();
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400),
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: detailsList.length,
        itemBuilder: (_,index){
          String key = detailsList[index].keys.first;
          return ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              Heading('$key'),
              Content('${detailsList[index][key]}'),

            ],
          );
        },
      ),
    );
  }
}

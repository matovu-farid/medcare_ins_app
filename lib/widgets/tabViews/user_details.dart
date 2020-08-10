import 'package:flutter/material.dart';
import 'package:medicalApp/gloabal_functions/genClient.dart';
import 'package:medicalApp/models/client.dart';
import 'package:medicalApp/widgets/tabViews/components/history_details_heading.dart';
class UserDetails extends StatelessWidget {
  final Client client ;

  UserDetails(this.client);

  List<Map<String,String>> get  detailsList => client.userProfile.toList();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: detailsList.length,
      itemBuilder: (_,index){
        String key = detailsList[index].keys.first;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Heading('${key}'),
            Content('${detailsList[index][key]}'),

          ],
        );
      },
    );
  }
}

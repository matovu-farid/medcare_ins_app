import 'dart:html';

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/gloabal_functions/genClient.dart';
import 'package:medicalApp/models/client.dart';
import 'package:mock_data/mock_data.dart';

Image createImage(BuildContext context,Client client) {
  return Image(
//      image: AssetImage('images/profile_images/${mockInteger(1, 9)}.jpg'));
      image: AssetImage(client.history.iconPath));
}
class HistoryListView extends StatefulWidget {
  @override
  _HistoryListViewState createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  List<Client> clientList = generateClientList();



  Color heartColor(Client client){
    if(client.userProfile.likability=='Dislike'){
      return ThemeData().splashColor;
    }
    else return Colors.red;
  }
  //Future future ()async=> await Future.delayed(Duration(milliseconds: 1));

  tapHeart(Client client){
    setState(() {
      if(client.userProfile.likability=='DisLike')client.userProfile.likability='Like';
      else client.userProfile.likability='DisLike';
    });
  }



  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(
          thickness: 3,
        ),
        itemCount: clientList.length,
        itemBuilder: (_, index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: ListTile(
              trailing: SizedBox(
                width: 200,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ListTile(
                    title: Text('${clientList[index].history.sum} UGX'),
                    subtitle: Text(clientList[index].history.date),
                  ),
                ),
              ),
              focusColor: Colors.blue,
              hoverColor: Colors.green,
              title: Text(' ${clientList[index].history.hospitalName}'),
              subtitle: Text('${clientList[index].history.hospitalLocation}.'),
              leading: DefaultAssetBundle(
                  bundle: DefaultAssetBundle.of(context),
                  child: createImage(context,clientList[index])),
            ),
          );
        });
  }
}

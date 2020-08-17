import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:medicalApp/models/clients/client.dart';
import 'package:scoped_model/scoped_model.dart';


Image createImage(BuildContext context, Client client) {
  return Image(image: AssetImage(client.history.iconPath));
}

class HistoryListView extends StatelessWidget {
  final List<Client> clientList;
  final Client client;

  Stream<String> createAStream() async* {
    yield 'Not Clicked';
  }

  HistoryListView(this.clientList, this.client);

  Color heartColor(Client client) {
    if (client.userProfile.likability == 'Dislike') {
      return ThemeData().splashColor;
    } else
      return Colors.red;
  }

  //Future future ()async=> await Future.delayed(Duration(milliseconds: 1));

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 400),
      child: ListView.separated(
          shrinkWrap: true,
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
              child: SizedBox(
                width: 300,
                child: ScopedModelDescendant<MedicalModel>(
                    builder: (context, child, model) {
                  return ListTile(
                    onTap: () {
                      model.setBuildDetails();
                    },
                    trailing: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ListTile(
                          title: Text('${clientList[index].history.sum} UGX'),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Text(clientList[index].history.date),
                          ),
                        ),
                      ),
                    ),
                    focusColor: Colors.blue,
                    hoverColor: Colors.green,
                    title: Text(' ${clientList[index].history.hospitalName}'),
                    subtitle:
                        Text('${clientList[index].history.hospitalLocation}.'),
                    leading: DefaultAssetBundle(
                        bundle: DefaultAssetBundle.of(context),
                        child: createImage(context, clientList[index])),
                  );
                }),
              ),
            );
//
          }),
    );
  }
}

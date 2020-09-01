import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:medicalApp/models/clients/client.dart';
import 'package:medicalApp/models/clients/history.dart';
import 'package:scoped_model/scoped_model.dart';


Image createImage(BuildContext context, History history) {
  return Image(image: AssetImage(history.iconPath));
}

class HistoryListView extends StatelessWidget {


final MedicalModel model;


HistoryListView(this.model);

Color heartColor(MyClient client) {
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
          itemCount: model.historyList.length,
          itemBuilder: (_, index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),

                  child: ListTile(
                    onTap: () {
                      model.setSelectedHistory(model.historyList[index]);
                    },
                    trailing: SizedBox(
                      width: 150,
                      child: ListTile(
                        title: Text('${model.historyList[index].sum} UGX'),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(1),
                          child: Text(model.historyList[index].date),
                        ),
                      ),
                    ),
                    focusColor: Colors.blue,
                    hoverColor: Colors.green,
                    title: Text(' ${model.historyList[index].hospitalName}'),
                    subtitle:
                    Text('${model.historyList[index].hospitalLocation}.'),
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: FittedBox(
                        child: DefaultAssetBundle(
                            bundle: DefaultAssetBundle.of(context),
                            child: createImage(context, model.historyList[index])),
                      ),
                    ),
                  )
              ),
            );
//
          }),
    );
  }
}


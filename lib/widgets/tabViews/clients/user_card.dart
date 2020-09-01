import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/gloabal_functions/generateClient/genHistory.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:medicalApp/models/clients/client.dart';
import 'package:medicalApp/models/clients/history.dart';
import 'package:medicalApp/widgets/holderTabs/benefits_button.dart';
import 'package:medicalApp/widgets/holderTabs/card_button.dart';
import 'package:medicalApp/widgets/holderTabs/history_button.dart';
import 'package:medicalApp/widgets/holderTabs/user_button.dart';


import 'package:scoped_model/scoped_model.dart';

import 'client_options/card_pic.dart';
import 'client_options/benefits_widget.dart';
import 'client_options/history_details.dart';
import 'client_options/hystory widget.dart';
import 'client_options/profile.dart';


class UserCard extends StatefulWidget {
  final MyClient client;
  final List<MyClient> clientList;
  static bool buildDetails = false;
  final MedicalModel model;


  UserCard(this.client, this.clientList,this.model);

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> with SingleTickerProviderStateMixin {

  Image createImage(BuildContext context, MyClient client) {
    return Image(image: AssetImage(client.userProfile.imagePath));
  }

  TextStyle setTextStyle() {
    return (widget.client.userProfile.holderStatus == 'Card Holder')
        ? TextStyle(color: Colors.green, backgroundColor: Colors.green[100])
        : TextStyle(color: Colors.red, backgroundColor: Colors.red[100]);
  }

  final tabs = [
    ProfileButton(),
    BenefitsButton(),
    CardButton(),
    HistoryButton()
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Card(
            shadowColor: Colors.grey[700],
            elevation: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 400,
                  child: ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(LineAwesomeIcons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(LineAwesomeIcons.trash),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    title: Text(' ${widget.client.userProfile.name}'),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${widget.client.userProfile.company.companyName}.'),
                        Text(
                          '${widget.client.userProfile.holderStatus}.',
                          style: setTextStyle(),
                        ),
                      ],
                    ),
                    leading: Column(
                      children: [
                        if(widget.client.isGenerated)
                          SizedBox(
                              width:50,
                              height: 50,
                              child: FittedBox(child: createImage(context, widget.client))),
                        if(!widget.client.isGenerated)
                          SizedBox(
                            width: 50,
                              height: 50,
                              child: FittedBox(
                                  child: widget.client.userProfile.imageWidget
                              ))
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        'Reg Date : ${widget.client.userProfile.regDate}',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400,
                  ),
                  child: TabBar(
                    tabs: tabs,
                    controller: _tabController,
                    labelColor: Colors.blue,
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.5,
                    maxWidth: 400,
                  ),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Profile(widget.client),
                      BenefitsListView(widget.client),
                      CardListView(widget.client),
                      HistoryListView( widget.model),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if(widget.model.history!=null)
          HistoryDetails(widget.client,widget.model.history)
      ],
    );
  }
}

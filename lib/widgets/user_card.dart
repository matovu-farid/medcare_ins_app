import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/gloabal_functions/genClient.dart';
import 'package:medicalApp/models/client.dart';
import 'package:medicalApp/widgets/tabViews/benefits_widget.dart';
import 'package:medicalApp/widgets/tabViews/card_pic.dart';
import 'package:medicalApp/widgets/tabViews/hystory%20widget.dart';
import 'package:medicalApp/widgets/tabViews/user_details.dart';

import 'package:medicalApp/widgets/userOptions/benefits_button.dart';
import 'package:medicalApp/widgets/userOptions/card_button.dart';
import 'package:medicalApp/widgets/userOptions/history_button.dart';
import 'package:medicalApp/widgets/userOptions/user_button.dart';


class UserCard extends StatefulWidget {
  final Client client;
  final List<Client> clientList;

  UserCard(this.client,this.clientList);

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard>
    with SingleTickerProviderStateMixin {
  Image createImage(BuildContext context, Client client) {
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
    return Card(
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
                  IconButton(icon: Icon(LineAwesomeIcons.edit)),
                  IconButton(
                    icon: Icon(LineAwesomeIcons.trash),
                  ),
                ],
              ),
              isThreeLine: true,
              title: Text(' ${widget.client.userProfile.name}'),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${widget.client.userProfile.company}.'),
                  Text(
                    '${widget.client.userProfile.holderStatus}.',
                    style: setTextStyle(),
                  ),
                ],
              ),
              leading: createImage(context, widget.client),
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
              maxWidth:400,),
            child: TabBar(

              tabs: tabs,
              controller: _tabController,
              labelColor: Colors.blue,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5,maxWidth:400,),

            child: TabBarView(
              controller: _tabController,
              children: [
                UserDetails(widget.client),
                BenefitsListView(widget.client),
                CardListView(widget.client),
                HistoryListView(widget.clientList),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

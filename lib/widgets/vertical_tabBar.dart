import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/gloabal_functions/generateClient/genClient.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:medicalApp/models/clients/client.dart';
import 'package:medicalApp/widgets/tabViews/clients/user_tile.dart';
import 'package:medicalApp/widgets/tabViews/home/homeView.dart';
import 'package:medicalApp/widgets/tabViews/insuranrers/insurance_widget.dart';
import 'package:medicalApp/widgets/tabViews/registration_form/registration_page.dart';
import 'package:medicalApp/widgets/tabViews/settings/setting_widget.dart';
import 'package:medicalApp/widgets/tabViews/statistics/statistics.dart';

class VerticalTabBar extends StatefulWidget {
  MyClient client;
  final List<MyClient> clientList ;
  final MedicalModel model;
  VerticalTabBar(this.clientList,this.model);


  @override
  _VerticalTabBarState createState() => _VerticalTabBarState();
}

class _VerticalTabBarState extends State<VerticalTabBar>
    with SingleTickerProviderStateMixin {
  TabController _controller;


  var tabs = [
    RotatedBox(
      quarterTurns: 1,
      child: Tab(icon: Icon(Icons.settings), text: 'Settings'),
    ),
    RotatedBox(
      quarterTurns: 1,
      child: Tab(icon: Icon(LineAwesomeIcons.file_contract), text: 'Insurance'),
    ),
    RotatedBox(
      quarterTurns: 1,
      child: Tab(
        icon: Icon(LineAwesomeIcons.user),
        text: 'Holders',
      ),
    ),
    RotatedBox(
      quarterTurns: 1,
      child: Tab(icon: Icon(LineAwesomeIcons.television), text: 'Statistics'),
    ),
    RotatedBox(
      quarterTurns: 1,
      child: Tab(icon: Icon(LineAwesomeIcons.registered_trademark), text: 'Register'),
    ),
    RotatedBox(
      quarterTurns: 1,
      child: Tab(icon: Icon(LineAwesomeIcons.warehouse), text: 'Home'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    widget.client = widget.clientList[0];
    _controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: RotatedBox(
        quarterTurns: 3,
        child: ListView(
          shrinkWrap: true,
          children: [
            ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                child: Container(
                    color: Colors.green,
                    child: TabBar(
                      tabs: tabs,
                      controller: _controller,
                    ))),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.width,
              ),
              child: RotatedBox(
                quarterTurns: 1,
                child: TabBarView(controller: _controller, children: [
                  SettingsTab(widget.model),
                  InsuranceTab(widget.model),
                  UserTileListView(widget.client, widget.clientList,widget.model),
                  Statistics(),
                  RegistrationPage(),
                  HomeTab(widget.client, widget.clientList),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

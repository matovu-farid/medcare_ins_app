import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/widgets/user_tile.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

//class VerticalTabBar extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return VerticalTabs(
//      indicatorColor: Colors.blue,
//
//      selectedTabBackgroundColor: Colors.yellow,
//      changePageDuration: Duration(milliseconds: 100),
//      indicatorWidth: 1,
//        tabsWidth: 150,
//        tabs: [
//
//         Tab(
//          icon: Align(
//            alignment: Alignment.centerLeft,
//            child: SizedBox(
//
//              width: 25,
//                child: Icon(LineAwesomeIcons.warehouse)),
//          ),
//          text:'Home'
//        ),
//
//      Tab(
//        icon: Icon(LineAwesomeIcons.file_contract),
//        text:'Insurance'
//      ),
//
//      Tab(
//
//        icon: Icon(LineAwesomeIcons.user),
//        text:'Holders',
//      ),
//
//      Tab(
//        icon: Icon(LineAwesomeIcons.television),
//        text:'Statistics'
//      ),
//
//      Tab(
//        icon: Icon(Icons.settings),
//        text:'Settings'
//      ),
//
//    ], contents: [
//      Padding(
//        padding: const EdgeInsets.all(8.0),
//        child: Text('Hey'),
//      ),
//      Padding(
//        padding: const EdgeInsets.all(8.0),
//        child: Text('Hey'),
//      ),
//      Padding(
//        padding: const EdgeInsets.all(8.0),
//        child: Padding(
//          padding: const EdgeInsets.only(left:8.0),
//          child: UserListView(),
//        ),
//      ),
//      Padding(
//        padding: const EdgeInsets.all(8.0),
//        child: Text('Hey'),
//      ),
//      Padding(
//        padding: const EdgeInsets.all(8.0),
//        child: Text('Hey'),
//      ),
//
//    ]);
//  }
//}

class VerticalTabBar extends StatefulWidget {
  @override
  _VerticalTabBarState createState() => _VerticalTabBarState();
}

class _VerticalTabBarState extends State<VerticalTabBar> with SingleTickerProviderStateMixin {
  TabController _controller ;
  var tabs= [

    RotatedBox(
      quarterTurns: 1,

      child: Tab(
          icon: Icon(Icons.settings),
          text:'Settings'
      ),
    ),

      RotatedBox(
        quarterTurns: 1,
        child: Tab(
          icon: Icon(LineAwesomeIcons.file_contract),
          text:'Insurance'
        ),
      ),

      RotatedBox(
        quarterTurns: 1,
        child: Tab(

          icon: Icon(LineAwesomeIcons.user),
          text:'Holders',
        ),
      ),

      RotatedBox(
        quarterTurns: 1,
        child: Tab(
          icon: Icon(LineAwesomeIcons.television),
          text:'Statistics'
        ),
      ),
    RotatedBox(
      quarterTurns: 1,
      child: Tab(
          icon: Icon(LineAwesomeIcons.warehouse),
          text:'Home'
      ),
    ),




    ];
  @override
  void initState() {

    super.initState();
    _controller = TabController(length: tabs.length, vsync: this);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.height,),
              child: Container(
                color: Colors.green,
                  child: TabBar(tabs: tabs,controller: _controller,))),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,


            ),
            child: RotatedBox(
              quarterTurns: 1,
              child: TabBarView(
                controller: _controller,
                  children: [
                Text('Hey'),
                Text('Hey'),
                UserListView(),
                Text('Hey'),
                Text('Hey'),

              ]),
            ),
          )
        ],
      ),
    );
  }
}



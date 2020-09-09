import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:medicalApp/models/clients/myclient.dart';
import 'package:medicalApp/widgets/tabViews/clients/user_tile.dart';

import 'package:mock_data/mock_data.dart';
import 'package:scoped_model/scoped_model.dart';

import 'homeView.dart';
import 'package:medicalApp/gloabal_functions/generateClient/genHistory.dart';

class DefaultHomeTab extends StatefulWidget {

  @override
  _DefaultHomeTabState createState() => _DefaultHomeTabState();
}

class _DefaultHomeTabState extends State<DefaultHomeTab> {
  ScrollController _scrollController;
  ScrollController _biggerController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _biggerController= ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _biggerController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: DraggableScrollbar.rrect(
            key: Key('biggerScrollBar'),
            backgroundColor: Colors.grey,
            alwaysVisibleScrollThumb: true,
            controller: _biggerController,
            child: ListView(
              controller: _biggerController,
              children: [
                Center(
                  child: Text(
                    'DashBoard OverView',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: FittedBox(
                        child: Card(
                          elevation: 1,
                          child: ScopedModelDescendant<MedicalModel>(
                            builder: (context, child ,model) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  TitleCircle(
                                    title: 'Hospitals',
                                    text: '${model.hospitalCollection.length}',
                                    onViewTap: ()=>Navigator.pushNamed(context, '/hospitalView'),
                                    heroTag: 'viewHospitals',
                                  ),
                                  TitleCircle(
                                    title: 'Active Card',
                                    text: '${mockInteger(1, 999)}',
                                    heroTag: 'viewActiveCards',
                                  ),
                                  TitleCircle(
                                    title: 'Insurers',
                                    text: '${model.clientCoCollection.length}',
                                    onViewTap: ()=>Navigator.pushNamed(context, '/clientCoView'),
                                    heroTag: 'viewInsurers',
                                  ),
                                ],
                              );
                            }
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                Column(
                  children: [
                    Text('Recently added'),
                    ScopedModelDescendant<MedicalModel>(builder: (_,__,model){
                       List<MyClient> recentlyAddedList=
                           model.clientList.sublist(
                               model.clientList.length-4,model.clientList.length).reversed.toList();
                      return SizedBox(
                        width: MediaQuery.of(context).size.width ,
                        height: MediaQuery.of(context).size.height ,
                        child: Card(
                          elevation: 2,
                          child: TileList(
                            scrollController: _scrollController,
                            searchedClients: recentlyAddedList,
                            model: model,
                          ),
                        ),
                      );
                    })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

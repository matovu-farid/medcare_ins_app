import 'package:flutter/cupertino.dart';
import 'package:medicalApp/gloabal_functions/client_company_functioni/genClientCompanies.dart';
import 'package:medicalApp/gloabal_functions/generateClient/genHistory.dart';
import 'package:medicalApp/gloabal_functions/insurance_func/genInsuranceModel.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:medicalApp/widgets/tabViews/home/default_home_tab.dart';
import 'package:medicalApp/models/clients/client.dart';
import 'package:medicalApp/widgets/tabViews/home/circle_text.dart';
import 'package:flutter/material.dart';
import 'package:medicalApp/widgets/tabViews/home/views/home_views/clientCo_view.dart';
import 'package:mock_data/mock_data.dart';
import 'package:scoped_model/scoped_model.dart';

import 'views/home_views/hospitals_view.dart';

class HomeTab extends StatelessWidget {
  final List<MyClient> clientList;
  final MyClient client;


  HomeTab(this.client, this.clientList);

  @override
  Widget build(BuildContext context) {
//    final List<Map<String,List<String>>> hospitalCollection  = hospitalMap;
//    final List<Map<String,List<String>>> clientCoCollection =getClientCompanyList();
    return MaterialApp(
      routes:
        {'/':(_)=>DefaultHomeTab(),
          '/hospitalView':(_)=>ScopedModelDescendant<MedicalModel>(
            builder: (context, ____,model) {
              return HospitalsOverView(model.hospitalCollection);
            }
          ),
          '/clientCoView':(_)=>ScopedModelDescendant<MedicalModel>(
            builder: (context,___,model) {
              return ClientCompanyOverView(model.clientCoCollection);
            }
          ),
        },
        );
  }
}

class TitleCircle extends StatelessWidget {
  final String title;
  final String text;
  final Function onViewTap;
  final heroTag;

  TitleCircle(
      {Key key,
      this.title = 'title',
      this.text = 'text',
      this.onViewTap,
      this.heroTag})
      : super(key: key);
  Key keySize = Key('fractionSizedBox');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Text(title),
        SizedBox(
          width: 200,
          height: 200,
          child: FittedBox(
            child: CircleText(
              text: text,
            ),
          ),
        ),
        SizedBox(
          height: 25,
            width: 100,
            child: FittedBox(child: ViewButton(onPressed: onViewTap, heroTag: heroTag)))
      ],
    );
  }
}

class ViewButton extends StatelessWidget {
  final Function onPressed;
  final String heroTag;

  ViewButton({this.onPressed, this.heroTag});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(

      onPressed: onPressed,
      label: Text('View'),
      heroTag: heroTag,
      backgroundColor: Colors.amber,
    );
  }
}

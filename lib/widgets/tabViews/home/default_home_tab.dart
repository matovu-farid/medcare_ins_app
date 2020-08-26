import 'package:flutter/material.dart';

import 'package:mock_data/mock_data.dart';

import 'homeView.dart';
import 'package:medicalApp/gloabal_functions/generateClient/genHistory.dart';

class DefaultHomeTab extends StatelessWidget {
  final List<Map<String,List<String>>> hospitalCollection;
  final List<Map<String,List<String>>> insuranceCollection;

   DefaultHomeTab({
    Key key, this.hospitalCollection, this.insuranceCollection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'DashBoard OverView',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.5,
                child: FittedBox(
                  child: Card(
                    elevation: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TitleCircle(
                          title: 'Hospitals',
                          text: '${hospitalCollection.length}',
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
                          text: '${insuranceCollection.length}',
                          onViewTap: ()=>Navigator.pushNamed(context, '/clientCoView'),
                          heroTag: 'viewInsurers',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

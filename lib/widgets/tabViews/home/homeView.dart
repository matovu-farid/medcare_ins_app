import 'package:flutter/cupertino.dart';
import 'package:medicalApp/widgets/tabViews/home/circle_text.dart';
import 'package:flutter/material.dart';
import 'package:mock_data/mock_data.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'DashBoard OverView',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Card(
              elevation: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                 TitleCircle(title: 'Hospitals',text: '${mockInteger(1,999)}',),
                  TitleCircle(title: 'Active Card',text: '${mockInteger(1,999)}',),
                  TitleCircle(title: 'Insurers',text: '${mockInteger(1,999)}',),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleCircle extends StatelessWidget {
  final String title;
  final String text;

   TitleCircle({
    Key key,this.title='title',this.text='text'
  }) : super(key: key);
   Key keySize = Key('fractionSizedBox');
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListTile(
          title: FractionallySizedBox(
            key: keySize,
            widthFactor: 0.2,
              child: Text(title)),
            subtitle: CircleText(text: text,),));
  }
}

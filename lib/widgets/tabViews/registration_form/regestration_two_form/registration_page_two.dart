import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/medical_model.dart';
import 'package:medicalApp/models/client_company_model/client_company_model.dart';
import 'package:medicalApp/models/clients/client.dart';
import 'package:medicalApp/models/clients/user_profile.dart';
import 'package:medicalApp/widgets/tabViews/registration_form/regestration_one_form/components/farid_form_field.dart';
import 'package:medicalApp/widgets/tabViews/registration_form/regestration_one_form/registration_page_one.dart';
import 'package:scoped_model/scoped_model.dart';

class AllBenefits extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final List<List<Map<String, dynamic>>> inPatientBenefitsList;
  final List<List<Map<String, dynamic>>> outPatientBenefitsList;
  final List<Map<String, String>> membersDetails;
  final List<Map<String, String>> familyDocInfo;

  final List<Map<String, String>> company;
   Widget imageWidget;

  AllBenefits(this.formKey,
      {this.inPatientBenefitsList,
      this.outPatientBenefitsList,
      this.membersDetails,

      this.familyDocInfo,
      this.company,
        this.imageWidget});

  @override
  _AllBenefitsState createState() => _AllBenefitsState();
}

class _AllBenefitsState extends State<AllBenefits> {
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Limit'),
          actions: [
            RaisedButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  void printItems() {
    widget.inPatientBenefitsList
        .where((listOfMaps) =>
            listOfMaps.first[listOfMaps.first.keys.first] == true)
        .map((listOfMaps) => print(
            '${listOfMaps[1].keys.first} : ${listOfMaps[1][listOfMaps[1].keys.first]}'))
        .toList();

    widget.outPatientBenefitsList
        .where((listOfMaps) =>
            listOfMaps.first[listOfMaps.first.keys.first] == true)
        .map((listOfMaps) => print(
            '${listOfMaps[1].keys.first} : ${listOfMaps[1][listOfMaps[1].keys.first]}'))
        .toList();
  }

  ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollbar.rrect(
      backgroundColor: Colors.green,
      alwaysVisibleScrollThumb: true,
      controller: _scrollController,
      child: ListView(
        controller: _scrollController,
        shrinkWrap: true,
        children: [
          RegHeader(
            text: 'BENEFITS',
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              InPatientBenefits(widget.inPatientBenefitsList),
              OutPatientBenefits(widget.outPatientBenefitsList)
            ],
          ),
          ScopedModelDescendant<MedicalModel>(

            builder: (context, child,model) {
              return Submit(widget: widget, model: model,);
            }
          )
        ],
      ),
    );
  }
}

class Submit extends StatelessWidget {
  const Submit({
    Key key,
    @required this.widget,
    @required this.model,

  }) : super(key: key);

  final AllBenefits widget;
  final MedicalModel model;


  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(10),
      onPressed: () {

        widget.formKey.currentState.save();
        MyClient client = MyClient(
          userProfile: UserProfile(
            holderStatus: widget.membersDetails[19][widget.membersDetails[19].keys.first],
            gender: widget.membersDetails[18][widget.membersDetails[18].keys.first],
            name: widget.membersDetails[0][widget.membersDetails[0].keys.first],
            dateOfBirth: widget.membersDetails[2][widget.membersDetails[2].keys.first],
            phoneNumber: widget.membersDetails[16][widget.membersDetails[16].keys.first],
            occupation: widget.membersDetails[5][widget.membersDetails[5].keys.first],
            bloodType: widget.membersDetails[8][widget.membersDetails[8].keys.first],
            address: widget.membersDetails[7][widget.membersDetails[7].keys.first],
            email: widget.membersDetails[14][widget.membersDetails[14].keys.first],
            regDate: widget.membersDetails[17][widget.membersDetails[17].keys.first],
            company: ClientCompany(
              companyName: widget.company[0][widget.company[0].keys.first],
              location: widget.company[1][widget.company[1].keys.first],
            ),
          )..imageWidget = widget.imageWidget,
          isGenerated: false,
          allBenefits: {
            'outPatientBenefits':widget.outPatientBenefitsList
                .where((listOfMaps) =>
            listOfMaps.first[listOfMaps.first.keys.first] ==
                true)
                .map((listOfMaps) =>
            {'${listOfMaps[0].keys.first}' : '${listOfMaps[1][listOfMaps[1].keys.first]}'})
                .toList(),
            'inPatientBenefits':widget.inPatientBenefitsList
                .where((listOfMaps) =>
            listOfMaps.first[listOfMaps.first.keys.first] ==
                true)
                .map((listOfMaps) =>
            {'${listOfMaps[0].keys.first}' : '${listOfMaps[1][listOfMaps[1].keys.first]}'})
                .toList()
          },

        );

        model.addToClientList(client);

      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Submit',
          style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              backgroundColor: Colors.green),
        ),
      ),
    );
  }
}

class InPatientBenefits extends StatefulWidget {
  final List<List<Map<String, dynamic>>> inPatientBenefitsList;

  InPatientBenefits(this.inPatientBenefitsList);

  @override
  _InPatientBenefitsState createState() => _InPatientBenefitsState();
}

class _InPatientBenefitsState extends State<InPatientBenefits> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text('In Patient Benefits'),
        ...widget.inPatientBenefitsList.map((benefitList) => SizedBox(
          width: 600,
          child: Wrap(
            children: [
              CheckboxListTile(
                    title: Text(benefitList.first.keys.first),
                    value: benefitList.first[benefitList.first.keys.first],
                    onChanged: (bool value) {
                      setState(() {
                        benefitList.first[benefitList.first.keys.first] = value;
                      });

                    },
                  ),
              if(benefitList.first[benefitList.first.keys.first])
                TextBox(
                  text: 'Limit',
                  onSaved: (textGot){
                    benefitList.add({'Limit': textGot});
                  },

                )
            ],

          ),
        ))
      ],
    );
  }
}

class OutPatientBenefits extends StatefulWidget {
  final List<List<Map<String, dynamic>>> outPatientBenefitsList;

  OutPatientBenefits(this.outPatientBenefitsList);

  @override
  _OutPatientBenefitsState createState() => _OutPatientBenefitsState();
}

class _OutPatientBenefitsState extends State<OutPatientBenefits> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text('Out Patient Benefits'),
        ...widget.outPatientBenefitsList.map((benefitList) => Wrap(
          children: [
            CheckboxListTile(
                  title: Text(benefitList.first.keys.first),
                  value: benefitList.first[benefitList.first.keys.first],
                  onChanged: (bool value) {
                    setState(() {
                      benefitList.first[benefitList.first.keys.first] = value;
                    });


                  },
                ),
            if(benefitList.first[benefitList.first.keys.first])
              TextBox(
                text: 'Limit',
                onSaved: (textGot){
                  benefitList.add({'Limit': textGot});
                },

              )
          ],
        ))
      ],
    );
  }
}

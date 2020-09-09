import 'package:flutter/material.dart';
import 'package:medicalApp/widgets/tabViews/registration_form/regestration_one_form/components/farid_form_field.dart';
import 'package:medicalApp/widgets/tabViews/registration_form/regestration_one_form/registration_page_one.dart';



class AllBenefitsWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final List<List<Map<String, dynamic>>> inPatientBenefitsList;
  final List<List<Map<String, dynamic>>> outPatientBenefitsList;
  final List<Map<String, String>> membersDetails;
  final List<Map<String, String>> familyDocInfo;

  final List<Map<String, String>> company;
   Widget imageWidget;

  AllBenefitsWidget(this.formKey,
      {this.inPatientBenefitsList,
      this.outPatientBenefitsList,
      this.membersDetails,
      this.familyDocInfo,
      this.company,
      this.imageWidget});

  @override
  _AllBenefitsWidgetState createState() => _AllBenefitsWidgetState();
}

class _AllBenefitsWidgetState extends State<AllBenefitsWidget> {
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
    return FittedBox(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
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

          ],
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
    return FittedBox(
      child: SizedBox(
        width: 300,
        height: 500,
        child: Column(
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
                      if (benefitList.first[benefitList.first.keys.first])
                        TextBox(
                          text: 'Limit',
                          onSaved: (textGot) {
                            benefitList.add({'Limit': textGot});
                          },
                        )
                    ],
                  ),
                ))
          ],
        ),
      ),
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
    return FittedBox(
      child: SizedBox(
        width: 300,
        height: 600,
        child: Column(
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
                    if (benefitList.first[benefitList.first.keys.first])
                      TextBox(
                        text: 'Limit',
                        onSaved: (textGot) {
                          benefitList.add({'Limit': textGot});
                        },
                      )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

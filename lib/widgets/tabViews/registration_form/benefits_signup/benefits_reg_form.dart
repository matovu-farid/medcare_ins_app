import 'package:flutter/material.dart';
import 'package:medicalApp/widgets/tabViews/registration_form/regestration_one_form/components/farid_form_field.dart';

import '../registration_page.dart';



class AllBenefitsWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final List<Map<String, dynamic>> inPatientBenefitsList;
  final List<Map<String, dynamic>> outPatientBenefitsList;
  final List<Map<String, dynamic>> membersDetails;
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
        child: ListView(
          children: [
            RegHeader(
              text: 'BENEFITS',
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: [
                InPatientBenefitsWidget(widget.inPatientBenefitsList),
                OutPatientBenefitsWidget(widget.outPatientBenefitsList)
              ],
            ),

          ],
        ),
      ),
    );
  }
}



class InPatientBenefitsWidget extends StatefulWidget {
  final List<Map<String, dynamic>> inPatientBenefitsList;

  InPatientBenefitsWidget(this.inPatientBenefitsList);

  @override
  _InPatientBenefitsWidgetState createState() => _InPatientBenefitsWidgetState();
}

class _InPatientBenefitsWidgetState extends State<InPatientBenefitsWidget> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width: 300,
        height: 500,
        child: ListView(

          children: [
            Text('In Patient Benefits'),
            ...widget.inPatientBenefitsList.map((benefitMap) => SizedBox(
                  width: 600,
                  child: Wrap(
                    children: [
                      CheckboxListTile(
                        title: Text(benefitMap.keys.first),
                        value: benefitMap['isShown'],
                        onChanged: (bool value) {
                          setState(() {
                            benefitMap['isShown'] = value;
                          });
                        },
                      ),
                      if (benefitMap['isShown'])
                        TextBox(
                          text: 'Limit',
                          onSaved: (textGot) {
                            benefitMap[benefitMap.keys.first]=int.parse(textGot);
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

class OutPatientBenefitsWidget extends StatefulWidget {
  final List<Map<String, dynamic>> outPatientBenefitsList;

  OutPatientBenefitsWidget(this.outPatientBenefitsList);

  @override
  _OutPatientBenefitsWidgetState createState() => _OutPatientBenefitsWidgetState();
}

class _OutPatientBenefitsWidgetState extends State<OutPatientBenefitsWidget> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width: 300,
        height: 600,
        child: Column(
          children: [
            Text('Out Patient Benefits'),
            ...widget.outPatientBenefitsList.map((benefitMap) => Wrap(
                  children: [
                    CheckboxListTile(
                      title: Text(benefitMap.keys.first),
                      value: benefitMap['isShown'],
                      onChanged: (bool value) {
                        setState(() {
                          benefitMap['isShown'] = value;
                        });
                      },
                    ),
                    if (benefitMap['isShown'])
                      TextBox(
                        text: 'Limit',
                        onSaved: (textGot) {
                          benefitMap[benefitMap.keys.first]=int.parse(textGot);

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

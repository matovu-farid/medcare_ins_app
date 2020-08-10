import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'file:///C:/Users/Sarah/Desktop/medcareInsApp/medicalApp/lib/widgets/tabViews/benefits_widget.dart';
import 'package:medicalApp/widgets/userOptions/option.dart';

class BenefitsButton extends Options {
  BenefitsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: const Icon(LineAwesomeIcons.envelope_open_text),
      text: 'Benefits',
    );
  }
}

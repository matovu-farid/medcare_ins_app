import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/widgets/holderTabs/option.dart';

class CardButton extends Options {
  CardButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: const Icon(LineAwesomeIcons.cardboard_vr),
      text: 'Card',
    );
  }
}

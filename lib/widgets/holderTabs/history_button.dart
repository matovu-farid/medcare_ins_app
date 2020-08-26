import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/widgets/holderTabs/option.dart';

class HistoryButton extends Options {
  HistoryButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: const Icon(LineAwesomeIcons.history),
      text: 'History',
    );
  }
}

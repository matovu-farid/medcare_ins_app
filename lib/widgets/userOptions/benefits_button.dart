import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class BenefitsButton extends StatelessWidget {
  const BenefitsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(

      child: Row(
        children: [
          const Icon(LineAwesomeIcons.envelope_open_text),
          const Text('Benefits'),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
      onPressed: () { /* ... */ },
    );
  }
}

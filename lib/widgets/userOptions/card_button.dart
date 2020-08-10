import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(

      child: Row(
        children: [
          const Icon(LineAwesomeIcons.cardboard_vr),
          const Text('Card'),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
      onPressed: () { /* ... */ },
    );
  }
}
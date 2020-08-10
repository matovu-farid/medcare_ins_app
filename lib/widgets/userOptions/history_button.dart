import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HistoryButton extends StatelessWidget {
  const HistoryButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(

      child: Row(
        children: [
          const Icon(LineAwesomeIcons.history),
          const Text('History'),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
      onPressed: () { /* ... */ },
    );
  }
}

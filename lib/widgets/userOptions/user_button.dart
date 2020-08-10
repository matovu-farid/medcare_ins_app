import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(

      child: Row(
        children: [
          const Icon(LineAwesomeIcons.user_1),
          const Text('User Profile'),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
      onPressed: () { /* ... */ },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:medicalApp/widgets/userOptions/option.dart';

class ProfileButton extends Options {
  ProfileButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: const Icon(LineAwesomeIcons.user_1),
      text: 'User Profile',
    );
  }
}

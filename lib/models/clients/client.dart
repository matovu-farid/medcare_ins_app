

import 'package:medicalApp/models/clients/benefits.dart';
import 'package:medicalApp/models/clients/history.dart';
import 'package:medicalApp/models/clients/user_profile.dart';

class Client{
  final Benefits benefits;
  final History history;
  final UserProfile userProfile;

  Client({this.benefits,  this.history, this.userProfile});

  @override
  String toString() {
    return 'Client{benefits: $benefits, history: $history, userProfile: $userProfile}';
  }
}
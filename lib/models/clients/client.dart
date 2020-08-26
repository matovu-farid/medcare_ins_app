

import 'package:medicalApp/models/client_company_model/client_company_model.dart';
import 'package:medicalApp/models/clients/benefits.dart';
import 'package:medicalApp/models/clients/history.dart';
import 'package:medicalApp/models/clients/user_profile.dart';

class Clients{
  final Benefits benefits;
  final List<History> historyList;
  final UserProfile userProfile;


  Clients({this.benefits,  this.historyList, this.userProfile});

  @override
  String toString() {
    return 'Client{benefits: $benefits, history: $historyList, userProfile: $userProfile}';
  }
}
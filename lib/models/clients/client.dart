

import 'package:medicalApp/models/client_company_model/client_company_model.dart';
import 'package:medicalApp/models/clients/benefits.dart';
import 'package:medicalApp/models/clients/history.dart';
import 'package:medicalApp/models/clients/user_profile.dart';

class MyClient{
  // Benefits To be deprecated
  final Benefits benefits;
  final List<History> historyList;
  final UserProfile userProfile;
  final bool isGenerated;
 ////To be deprecated/////////////////////////////
  final List<Map<String,dynamic>> benefitsList;
  /////////////////////////////////////////////
  final Map<String,List<Map<String,dynamic>>> allBenefits;

  MyClient( {this.allBenefits,this.benefits,  this.historyList, this.userProfile ,this.isGenerated = true,this.benefitsList});

  @override
  String toString() {
    return 'Client{benefits: $benefits, history: $historyList, userProfile: $userProfile}';
  }
}
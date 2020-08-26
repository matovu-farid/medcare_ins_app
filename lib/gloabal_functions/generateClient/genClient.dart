import 'package:medicalApp/gloabal_functions/client_company_functioni/genClientCompanies.dart';
import 'package:medicalApp/models/clients/client.dart';

import 'genBenefits.dart';
import 'genHistory.dart';
import 'genUserProfile.dart';



Clients genClient(){
  return Clients(
      benefits: generateBenefits(),
      historyList: genHistoryList(),
      userProfile: generateUserProfile(),

  );
}
List<Clients> generateClientList(){
  List<Clients> clientList = [];

  for(int i = 0; i < 30;i++){
    clientList.add(genClient());
  }
  return clientList;
}
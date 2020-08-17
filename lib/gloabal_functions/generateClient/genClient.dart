import 'package:medicalApp/models/clients/client.dart';

import 'genBenefits.dart';
import 'genHistory.dart';
import 'genUserProfile.dart';



Client genClient(){
  return Client(
      benefits: generateBenefits(),
      history: generateHistory(),
      userProfile: generateUserProfile()
  );
}
List<Client> generateClientList(){
  List<Client> clientList = [];

  for(int i = 0; i < 30;i++){
    clientList.add(genClient());
  }
  return clientList;
}
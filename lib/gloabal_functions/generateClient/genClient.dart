import 'package:medicalApp/models/clients/client.dart';

import 'genBenefits.dart';
import 'genUserProfile.dart';



MyClient genClient(){
  return MyClient(
      benefits: generateBenefits(),
      userProfile: generateUserProfile(),

  );
}
List<MyClient> generateClientList(){
  List<MyClient> clientList = [];

  for(int i = 0; i < 30;i++){
    clientList.add(genClient());
  }
  return clientList;
}
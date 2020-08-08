import 'package:medicalApp/gloabal_functions/genBenefits.dart';
import 'package:medicalApp/gloabal_functions/genHistory.dart';
import 'package:medicalApp/gloabal_functions/genUserProfile.dart';
import 'package:medicalApp/models/client.dart';


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
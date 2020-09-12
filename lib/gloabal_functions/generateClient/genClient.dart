import 'package:medicalApp/gloabal_functions/generateClient/genHistory.dart';
import 'package:medicalApp/models/clients/myclient.dart';

import 'genBenefits.dart';
import 'genUserProfile.dart';

MyClient genClient() {
  return MyClient(
      allBenefits: generateAllBenefits(),
      userProfile: generateUserProfile(),
      historyList: genHistoryList());
}

List<MyClient> generateClientList() {
  List<MyClient> clientList = [];

  for (int i = 0; i < 30; i++) {
    clientList.add(genClient());
  }
  return clientList;
}

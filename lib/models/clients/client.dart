
import 'package:medicalApp/models/clients/history.dart';
import 'package:medicalApp/models/clients/user_profile.dart';
import 'package:uuid/uuid.dart';

class MyClient {

  List<History> historyList;
  final UserProfile userProfile;
  final bool isGenerated;
  String id;

  final Map<String, List<Map<String, dynamic>>> allBenefits;

  MyClient(
      {this.allBenefits,
      this.historyList,
      this.userProfile,
      this.isGenerated = true,
      })
  :id = Uuid().v4()
  ;

  @override
  String toString() {
    return 'MyClient{historyList: $historyList, userProfile: $userProfile, isGenerated: $isGenerated, id: $id, allBenefits: $allBenefits}';
  }
}

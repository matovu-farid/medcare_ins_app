import 'package:scoped_model/scoped_model.dart';

import 'models/clients/client.dart';
import 'models/clients/history.dart';
class MedicalModel extends Model{
  bool buildDetails = false;
  int insurerIndex;
  bool obsureAdminPassword=true;
  bool rememberMe = true;
  History history;

  void setRememberMe(bool value){
    rememberMe = value;
  }

  void setBuildDetails(History historyGot){
      buildDetails = !buildDetails;
       history = historyGot;
      notifyListeners();
  }
  void setInsurerIndex(int index){
    insurerIndex = index;
    notifyListeners();
  }
  void setObscureAdminPassword(){
    obsureAdminPassword = !obsureAdminPassword;
    notifyListeners();
  }
}
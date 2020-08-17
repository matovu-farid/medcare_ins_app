import 'package:scoped_model/scoped_model.dart';
class MedicalModel extends Model{
  bool buildDetails = false;
  int insurerIndex;
  bool obsureAdminPassword=true;
  bool rememberMe = true;
  void setRememberMe(bool value){
    rememberMe = value;
  }
  void setBuildDetails(){
      buildDetails = !buildDetails;
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
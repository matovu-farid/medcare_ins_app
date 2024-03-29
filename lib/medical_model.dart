import 'package:medicalApp/gloabal_functions/generateClient/genHistory.dart';
import 'package:scoped_model/scoped_model.dart';

import 'gloabal_functions/client_company_functioni/genClientCompanies.dart';
import 'gloabal_functions/generateClient/genClient.dart';
import 'gloabal_functions/insurance_func/genInsuranceModel.dart';
import 'models/clients/myclient.dart';
import 'models/clients/history.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
class MedicalModel extends Model{
  final List<Map<String,List<String>>> hospitalCollection  = hospitalMap;
  final List<Map<String,List<String>>> clientCoCollection =getClientCompanyList();
  final List<MyClient> clientList = generateClientList();
   List<String> get hospitalNameList =>
       hospitalCollection.map((map) => map[map.keys.first][0]).toList();
   final List<Map<String,List<String>>> insuranceCollection  = insLogoMap;
   List<String> get insuranceNameList =>
       insuranceCollection.map((map) => map[map.keys.first][0]).toList();

  MyClient client ;
  Widget imageWidget;
  int insurerIndex;
  bool obsureAdminPassword=true;
  bool rememberMe = true;

  UserHistory history ;
  //final List<History> historyList = client.historyList;
  Uint8List imageBytes;

  MyClient regesteredClient;

  setImageBytes(Uint8List bytes){
    imageBytes = bytes;
    notifyListeners();

  }

  setRegesteredClient(MyClient client){
    regesteredClient = client;
    notifyListeners();
  }

  void setImageWidget(Widget imageWidget){
    this.imageWidget =imageWidget;
    notifyListeners();
  }
void setClient(MyClient client){
  this.client = client;
  notifyListeners();

}
  void setRememberMe(bool value){
    rememberMe = value;
    notifyListeners();
  }
void addToClientList(MyClient client){
    clientList.add(client);
    notifyListeners();
}
  void setSelectedHistory(UserHistory historyGot){
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
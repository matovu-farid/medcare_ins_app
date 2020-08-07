
import 'package:medicalApp/models/history.dart';
import 'package:mock_data/mock_data.dart';

History generateHistory(){

  History history = History(
      patientInfo: generatePatentInfo(),
      medicalInfo: generateMedicalInfo(),
      clarification: gererateClarification());

  return history;

}


MedicalInfo generateMedicalInfo(){

  MedicalInfo medicalInfo = MedicalInfo(
    natureOfillness: _generateIllness(),
    diagnosis:  _generateDiagnosis(),
    condition:  _generateCondition(),
    consultationFee: generateMoney(),
    hospitalServices: generateMapStringInt(),
    results: generateMapStringString(),
  );
  return medicalInfo;
}

_generateDiagnosis() {
  List<String> relationShips = ['Cancer','Aids','Polio','Hepatitis','Syphilis'];
  var relationship = relationShips[mockInteger(0,relationShips.length-1)];
  print(relationship);
  return relationship;
}

String _generateCondition() {
  List<String> relationShips = ['terminal','fatal','chronic','serious','minor'];
  var relationship = relationShips[mockInteger(0,relationShips.length-1)];
  print(relationship);
  return relationship;

}

PatientInfo generatePatentInfo(){
  PatientInfo patientInfo = PatientInfo(
    patientName: generateName(),
    relationship: _generateRelationShip(),
    dateOfBirth: generateDate(),
    gender: _generateGender(),
    medicalCardNo: mockUUID(),
  );
  return patientInfo;

}
Clarification gererateClarification(){
  Clarification clarification = Clarification(
    doctorsName: generateName(),
    doctorsQualification: _generateQualiification(),
  );
  return clarification;
}

int generateMoney(){
  return mockInteger()*10000;
}
String generateString(){
  return mockString(10,'a');
}
List<Map<String,int>>  generateMapStringInt(){
  List<Map<String,int>> mapList=[];
  for(int i= 0; i < 10 ; i++){
    Map<String,int> map = {generateString():generateMoney()};
    mapList.add(map);
  }
  return mapList;

}
List<Map<String,String>>  generateMapStringString(){
  List<Map<String,String>> mapList=[];
  for(int i= 0; i < 10 ; i++){
    Map<String,String> map = {generateString():generateString()};
    mapList.add(map);
  }
  print(mapList);
  return mapList;

}
String generateName(){
  return '${mockName()} ${mockName()}';
}
DateTime generateDate(){
  return mockDate(DateTime(1980));
}


String _generateRelationShip(){

  List<String> relationShips = ['father','self','mother','sister','brother','uncle','aunt'];
  var relationship = relationShips[mockInteger(0,relationShips.length-1)];
  print(relationship);
  return relationship;
}
String _generateIllness(){
  List<String> relationShips = ['malaria','AIDS','Whooping Cough','Corona','Typhoid','Cancer','Syphilis'];
  var illness = relationShips[mockInteger(0,relationShips.length-1)];
  return illness;
}
String _generateGender(){
  List<String> relationShips = ['male','female'];
  var gender = relationShips[mockInteger(0,relationShips.length-1)];
  return gender;
}
String _generateQualiification(){
  List<String> relationShips = ['criminologist','dietitian','surgeon','general doctor','dentist','optician'];
  var qualification = relationShips[mockInteger(0,relationShips.length-1)];
  return qualification;}

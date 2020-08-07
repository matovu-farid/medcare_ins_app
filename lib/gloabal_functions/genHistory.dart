
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
    hospitalServices: generateMapStringInt(generateHospitalServices(),mockInteger()*7000),
    results: generateMapStringString(generateResults()),
  );
  return medicalInfo;
}

_generateDiagnosis() {
  List<String> relationShips = ['Cancer','Aids','Polio','Hepatitis','Syphilis'];
  var relationship = relationShips[mockInteger(0,relationShips.length-1)];

  return relationship;
}

String _generateCondition() {
  List<String> relationShips = ['terminal','fatal','chronic','serious','minor'];
  var relationship = relationShips[mockInteger(0,relationShips.length-1)];

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
List<Map<String,int>>  generateMapStringInt(String key,int value){
  List<Map<String,int>> mapList=[];
  for(int i= 0; i < 3 ; i++){
    Map<String,int> map = {key:value};
    mapList.add(map);
  }
  return mapList;

}
String generateHospitalServices(){
  List<String> relationShips = ['wound dressing','I&D','Blood tests','vaccination','antenatal','body dressing','treatment'];
  var relationship = relationShips[mockInteger(0,relationShips.length-1)];

  return relationship;
}
List<Map<String,String>>  generateMapStringString(Map<String,Map<String,String>> mapSent){
  List<Map<String,String>> mapList=[];
  String mapKey = mapSent.keys.first;
  for(int i= 0; i < 10 ; i++){
    Map<String,String> map = mapSent[mapKey];
    mapList.add(map);
  }
  mapList.add({'Result':mapKey});
  return mapList;

}
Map<String,String> genTests(){
  var result = ['Negative','Positive'];
  var test = ['Risus commodo','Quis ipsum suspendisse'];
  mockInteger(0,1);
  return {test[mockInteger(0,test.length-1)]:result[mockInteger(0,result.length-1)]};
}
Map<String,Map<String,String>> generateResults(){
  var illness = ['malaria','Aids','Cholera','Typhoid','Whooping Cough'];
return {illness[mockInteger(0,illness.length-1)]: genTests()};
}
String generateName(){
  return '${mockName()} ${mockName()}';
}
String generateDate(){
  var dateTime = mockDate(DateTime(1980));
  String date = '${dateTime.day} / ${dateTime.month} / ${dateTime.year}';

  return date;
}


String _generateRelationShip(){

  List<String> relationShips = ['father','self','mother','sister','brother','uncle','aunt'];
  var relationship = relationShips[mockInteger(0,relationShips.length-1)];

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

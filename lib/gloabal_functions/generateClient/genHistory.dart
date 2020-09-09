
import 'package:medicalApp/models/clients/history.dart';
import 'package:mock_data/mock_data.dart';

List<UserHistory> genHistoryList(){
  final listOfHistory = <UserHistory>[];
  for(int i = 0;i<30;i++){
    listOfHistory.add(generateHistory());
  }
  return listOfHistory;
}
List<Map<String,List<String>>> hospitalMap =
[
  {'AAR':['AAR Health Services','images/hospital_logos/AAR.jpg']},
  {'Case':['Case Medical Centre','images/hospital_logos/Case.jpg']},
  {'IAA':['IAA Health Care','images/hospital_logos/IAA.jpg']},
  {'IHK':['International Hospital Kampala','images/hospital_logos/IHK.jpg']},
  {'Kibuli':['Kibuli Hospital','images/hospital_logos/Kibuli.jpg']},
  {'Lifelink':['LifeLink Hospital','images/hospital_logos/Lifelink.jpg']},
  {'Nakasero':['Nakasero Hospital','images/hospital_logos/Nakasero.jpg']},
  {'Nile':['Nile International Hospital','images/hospital_logos/Nile.jpg']},
  {'Norvik':['Norvik Hospital','images/hospital_logos/Norvik.jpg']},
  {'Paragon':['Paragon Hospital','images/hospital_logos/Paragon.jpg']},

];
Map<String,List<String>> _generateHospitalMap(){
  return hospitalMap[mockInteger(0,hospitalMap.length-1)];
}


UserHistory generateHistory(){
  Map<String,List<String>> hospitalMap = _generateHospitalMap();
  final String hospitalName = hospitalMap[hospitalMap.keys.first][0];
  final String hospitalLogoPath = hospitalMap[hospitalMap.keys.first][1];

  UserHistory history = UserHistory(
      patientInfo: _generatePatentInfo(),
      medicalInfo: _generateMedicalInfo(),
      clarification: _gererateClarification(),
    hospitalName: hospitalName,
    hospitalLocation: generatelocation(),
    iconPath: hospitalLogoPath,

  );

  return history;

}

String generatelocation() {
  List<String> relationShips = ['Kampala','Wakiso','Mbarara','Kitgum','Lira','Apach','Nebi','Teso','Mbale','Masaka'];
  var relationship = relationShips[mockInteger(0,relationShips.length-1)];

  return relationship;
}




MedicalInfo _generateMedicalInfo(){

  MedicalInfo medicalInfo = MedicalInfo(
    natureOfillness: _generateIllness(),
    diagnosis:  _generateDiagnosis(),
    condition:  _generateCondition(),
    consultationFee: generateMoney(),
    hospitalServices: generateMapStringInt(generateHospitalServices),
    results: generateMapStringString(generateResults),
    drugsPrescribed:generateMapStringInt(generateDrugsPrescribed),
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

PatientInfo _generatePatentInfo(){
  PatientInfo patientInfo = PatientInfo(
    patientName: generateName(),
    relationship: _generateRelationShip(),
    dateOfBirth: generateDate(),
    gender: _generateGender(),
    medicalCardNo: '${mockString(5)}-${mockInteger(9999,100000000)}',
  );
  return patientInfo;

}
Clarification _gererateClarification(){
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
List<Map<String,int>>  generateMapStringInt(Function key){
  List<Map<String,int>> mapList=[];
  int sum = 0;
  for(int i= 0; i < 3 ; i++){
    int money = mockInteger()*7;
    sum += money;
    Map<String,int> map = {key():money};
    mapList.add(map);
  }
  mapList.add({'sum':sum});

  return mapList;

}
String generateHospitalServices(){
  List<String> relationShips = ['wound dressing','I&D','Blood tests','vaccination','antenatal','body dressing','treatment'];
  var relationship = relationShips[mockInteger(0,relationShips.length-1)];

  return relationship;
}
String generateDrugsPrescribed(){
  List<String> relationShips = ['Panadol','Arv\'s','Coacetamol','Cetamol','Paracetamol','Vitamin C','Amoxil'];
  var relationship = relationShips[mockInteger(0,relationShips.length-1)];

  return relationship;
}

List<Map<String,String>>  generateMapStringString(Function mapSent){
  List<Map<String,String>> mapList=[];
String mapKey;
  for(int i= 0; i < 2 ; i++){
    var mapGot = mapSent();
     mapKey = mapGot.keys.first;
    Map<String,String> map = mapGot[mapKey];
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

  String date = '${dateTime.day}/${dateTime.month}/${dateTime.year}';

  return date;
}


var month = [
  'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'
];
String generateLastSeen(){
  var dateTime = mockDate(DateTime(2020));
  String date = '${dateTime.day} ${month[dateTime.month]} ';

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

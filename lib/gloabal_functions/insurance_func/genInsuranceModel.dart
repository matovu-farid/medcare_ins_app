import 'package:medicalApp/models/insurance_model/insurance_model.dart';
import 'package:mock_data/mock_data.dart';

List<InsuranceClass> generateInsuranceList(){
  var insuranceList = <InsuranceClass>[];

  for(int i = 0; i<10 ;i ++){
    insuranceList.add(generateInsurance());
  }
  return insuranceList;

}

InsuranceClass generateInsurance(){
  return InsuranceClass(
      company: _generateCompany(),
      location: _generateAddress(),
    iconPath: _generatePath(),
    description: _generateDescription()
  );
}
String _generatePath(){
  return 'images/insurance_pics/${mockInteger(1,10)}.png';
}

String _generateCompany(){
  List<String> relationShips = ['Jubilee Life Insurance','AAR Health Services','None','Case MedCare','IAA Heath Care','Life Link'];
  return relationShips[mockInteger(0,relationShips.length-1)];}

String _generateAddress(){
  List<String> relationShips = ['Kampala','Mbale','Wakiso','Mbarara','Tororo','Gulu','Ntinda','Naalya','Soroti','Jinja'];
  return relationShips[mockInteger(0,relationShips.length-1)];}

  String _generateDescription(){
  var desciptors  = ['the best','an awesome','a good','an exeplary','an unbelievable'];
  var periodOfExistence = ['tons of experience','8 years in the field','tremedous talent in insuring you', '10 years of exellence','passion to serve you'];
    var verbs = ['endeavour','aspire','ensure','always try'];
    var adjectives = ['perfection','protection','success','enduring safety'];
  return 'This is ${desciptors[mockInteger(0,desciptors.length-1)]} with ${periodOfExistence[mockInteger(0,periodOfExistence.length-1)]}. \n We ${verbs[mockInteger(0,verbs.length-1)]} to deliver ${adjectives[mockInteger(0,adjectives.length-1)]}';

  }


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
  Map<String,List<String>> hospitalMap = _generateInsurancelMap();
  final String insuranceName = hospitalMap[hospitalMap.keys.first][0];
  final String insuranceLogoPath = hospitalMap[hospitalMap.keys.first][1];

  return InsuranceClass(

      company: insuranceName,
      location: _generateAddress(),
    iconPath: insuranceLogoPath,
    description: _generateDescription()
  );
}


List<Map<String,List<String>>> insLogoMap =
[
  {'AIG':['AIG Uganda Limited','images/insurance_logos/AIG.jpg']},
  {'Alliance':['Alliance Africa General Insurance Limited','images/insurance_logos/Alliance.jpg']},
  {'Britam':['Britam Insurance Uganda Limited','images/insurance_logos/Britam.jpg']},
  {'Underwriters':['East African Underwriters Limited','images/insurance_logos/Underwriters.jpg']},
  {'CIC':['CIC General Insurance Uganda Limited','images/insurance_logos/CIC.jpg']},
  {'Gold':['GoldStar Life Assurance Company Limited','images/insurance_logos/Gold.jpg']},
  {'NIC':['NIC General Insurance Company Limited','images/insurance_logos/NIC.jpg']},
  {'Swico':['Statewide Insurance Company Limited','images/insurance_logos/swico.jpg']},
  {'Jubilee':['The Jubilee Insurance Company of Uganda','images/insurance_logos/Jubilee.jpg']},
  {'TransAfrica':['TransAfrica Assurance Limited','images/insurance_logos/TransAfrica.jpg']},
{'UAP':['UAP Insurance Uganda Limited','images/insurance_logos/UAP.jpg']},

];
Map<String,List<String>> _generateInsurancelMap(){
  return insLogoMap[mockInteger(0,insLogoMap.length-1)];
}

List<Map<String,List<String>>> getInsList(){
  return insLogoMap;
}
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


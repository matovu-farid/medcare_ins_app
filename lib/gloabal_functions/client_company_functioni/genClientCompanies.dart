import 'package:medicalApp/models/client_company_model/client_company_model.dart';
import 'package:medicalApp/models/insurance_model/insurance_model.dart';
import 'package:mock_data/mock_data.dart';

List<ClientCompany> generateClientComopanyList(){
  var clientCompanyList = <ClientCompany>[];

  for(int i = 0; i<10 ;i ++){
    clientCompanyList.add(genClientCompany());
  }
  return clientCompanyList;

}

ClientCompany genClientCompany(){
  Map<String,List<String>> clientCoMap = _genClientCompanyMap();
  final String insuranceName = clientCoMap[clientCoMap.keys.first][0];
  final String clientCoLogoPath = clientCoMap[clientCoMap.keys.first][1];

  return ClientCompany(

      companyName: insuranceName,
      location: _generateAddress(),
    iconPath: clientCoLogoPath,

  );
}


List<Map<String,List<String>>> companyLogoMap =
[
  {'Eagle':['Eagle Air (Uganda)','images/company_logos/abc.jpg']},
  {'ABC':['ABC Bank (Uganda)','images/company_logos/africell.png']},
  {'Aya Group':['Aya Group','images/company_logos/aya.jpg']},
  {'Africell':['Africell','images/company_logos/africell.png']},
  {'BOU':['Bank of Uganda','images/company_logos/BOU.jpg']},
  {'Barclays Bank of Uganda':['Barclays Bank of Uganda','images/company_logos/barclays.jpg']},
  {'BOB':['Bank of Baroda Uganda Limited','images/company_logos/baroda.jpg']},
  {'Centenary Bank':['Centenary Bank','images/company_logos/centenary.jpg']},
  {'Imperial Hotels Group':['Imperial Hotels Group','images/company_logos/ImperialHotels.jpg']},
  {'K2':['K2 Telecom','images/company_logos/K2.png']},
{'Sheraton':['Kampala Sheraton Hotel','images/company_logos/sheraton.png']},
  {'Kinyara':['Kinyara Sugar Works Limited','images/company_logos/kinyara.jpg']},
{'Kyagalanyi':['Kyagalanyi Coffee Limited','images/company_logos/Kyagalanyi.png']},
{'Vision':['New Vision Group','images/company_logos/New.png']},
{'Posta Uganda':['Posta Uganda','images/company_logos/postaUg.png']},
{'Ruparelia ':['Ruparelia Group','images/company_logos/Ruparelia.jpg']},
{'serena ':['Serena Hotel','images/company_logos/serena.png']},
{'NWSC ':['National Water and Sewage Cooperation','images/company_logos/NWSC.jpg']},
{'speke ':['Speke Hotels','images/company_logos/speke.png']},

];
Map<String,List<String>> _genClientCompanyMap(){
  return companyLogoMap[mockInteger(0,companyLogoMap.length-1)];
}

List<Map<String,List<String>>> getClientCompanyList(){
  return companyLogoMap;
}
String _generateAddress(){
  List<String> relationShips = ['Kampala','Mbale','Wakiso','Mbarara','Tororo','Gulu','Ntinda','Naalya','Soroti','Jinja'];
  return relationShips[mockInteger(0,relationShips.length-1)];}

//  String _generateDescription(){
//  var desciptors  = ['the best','an awesome','a good','an exeplary','an unbelievable'];
//  var periodOfExistence = ['tons of experience','8 years in the field','tremedous talent in insuring you', '10 years of exellence','passion to serve you'];
//    var verbs = ['endeavour','aspire','ensure','always try'];
//    var adjectives = ['perfection','protection','success','enduring safety'];
//  return 'This is ${desciptors[mockInteger(0,desciptors.length-1)]} with ${periodOfExistence[mockInteger(0,periodOfExistence.length-1)]}. \n We ${verbs[mockInteger(0,verbs.length-1)]} to deliver ${adjectives[mockInteger(0,adjectives.length-1)]}';
//
//  }


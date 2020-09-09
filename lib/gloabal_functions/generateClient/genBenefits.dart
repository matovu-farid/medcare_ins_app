import 'package:medicalApp/models/clients/benefits.dart';
import 'package:mock_data/mock_data.dart';

Benefits generateBenefits(){

  Benefits benefits = Benefits(
      hospitalizationInsurance: _generateMoney(),
      tripsToEmergencyRoom: _generateMoney(),
      treatmentForInPatientCare: _generateMoney(),
      medicalEvacuation: _generateMoney(),
      prescriptionDrugs: _generateMoney(),
      mentalHealth: _generateMoney(),
      emergencyDentalCare: _generateMoney()

  );
  return benefits;
}
//
//Coverage _generateCoverage(){
//  List<Coverage> relationShips = [Coverage.Covered,Coverage.AssistanceOnly];
//  return relationShips[mockInteger(0,relationShips.length-1)];}

int _generateMoney(){
  return mockInteger()*100000;
}
Map<String,List<Map<String,dynamic>>> generateAllBenefits(){
return {
  'inPatientBenefits':generateBenefits().toList(),
  'outPatientBenefits':generateBenefits().toList()
};
}
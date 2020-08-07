import 'package:medicalApp/models/benefits.dart';
import 'package:mock_data/mock_data.dart';

Benefits generateBenefits(){

  Benefits benefits = Benefits(
      hospitalizationInsurance: _generateMoney(),
      tripsToEmergencyRoom: _generateCoverage(),
      treatmentForInPatientCare: _generateCoverage(),
      medicalEvacuation: _generateMoney(),
      prescriptionDrugs: _generateMoney(),
      mentalHealth: _generateCoverage(),
      emergencyDentalCare: _generateCoverage()

  );
  return benefits;
}

Coverage _generateCoverage(){
  List<Coverage> relationShips = [Coverage.Covered,Coverage.AssistanceOnly];
  return relationShips[mockInteger(0,relationShips.length-1)];}

int _generateMoney(){
  return mockInteger()*100000;
}

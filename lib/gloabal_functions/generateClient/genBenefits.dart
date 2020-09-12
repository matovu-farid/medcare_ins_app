import 'package:medicalApp/models/clients/benefits.dart';
import 'package:mock_data/mock_data.dart';

Benefits generateBenefits() {
  Benefits benefits = Benefits(
      hospitalizationInsurance: _generateMoney(),
      tripsToEmergencyRoom: _generateMoney(),
      treatmentForInPatientCare: _generateMoney(),
      medicalEvacuation: _generateMoney(),
      prescriptionDrugs: _generateMoney(),
      mentalHealth: _generateMoney(),
      emergencyDentalCare: _generateMoney());
  return benefits;
}

InPatientBenefits generateInPatientBenefits() {
  InPatientBenefits benefits = InPatientBenefits(
      illnessHospitalization: _generateMoney(),
      accidentalHospitalization: _generateMoney(),
      iCU: _generateMoney(),
      ambulanceServices: _generateMoney(),
      chronicsInPatient: _generateMoney(),
      gynecologicalSurvey: _generateMoney(),
      generalSurvey: _generateMoney(),
      maternity: _generateMoney(),
      funeral: _generateMoney());
  return benefits;
}

OutPatientBenefits generateOutPatientBenefits() {
  OutPatientBenefits benefits = OutPatientBenefits(
      outPatientGeneral: _generateMoney(),
      dental: _generateMoney(),
      optical: _generateMoney(),
      chronicsOutPatient: _generateMoney(),
      annualWellness: _generateMoney());
  return benefits;
}

//
//Coverage _generateCoverage(){
//  List<Coverage> relationShips = [Coverage.Covered,Coverage.AssistanceOnly];
//  return relationShips[mockInteger(0,relationShips.length-1)];}

int _generateMoney() {
  return mockInteger() * 100000;
}

Map<String, Map<String, dynamic>> generateAllBenefits() {
  return {
    'inPatientBenefits': generateInPatientBenefits().toJson(),
    'outPatientBenefits': generateOutPatientBenefits().toJson()
  };
}

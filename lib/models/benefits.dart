enum Coverage { AssistanceOnly, Covered }

class Benefits {
  final int hospitalizationInsurance;
  final Coverage tripsToEmergencyRoom;
  final int medicalEvacuation;
  final Coverage emergencyDentalCare;
  final Coverage treatmentForInPatientCare;
  final Coverage mentalHealth;
  final int prescriptionDrugs;

  Benefits(
      {this.hospitalizationInsurance,
      this.tripsToEmergencyRoom,
      this.medicalEvacuation,
      this.emergencyDentalCare,
      this.treatmentForInPatientCare,
      this.mentalHealth,
      this.prescriptionDrugs});

  @override
  String toString() {
    return 'Benefits{hospitalizationInsurance: $hospitalizationInsurance, tripsToEmergencyRoom: $tripsToEmergencyRoom, medicalEvacuation: $medicalEvacuation, emergencyDentalCare: $emergencyDentalCare, treatmentForInPatientCare: $treatmentForInPatientCare, mentalHealth: $mentalHealth, prescriptionDrugs: $prescriptionDrugs}';
  }

  List<Map<String, dynamic>> toList() {
    return [
      {'Hospitalization Insurance': hospitalizationInsurance},
      {'Trips To EmergencyRoom': tripsToEmergencyRoom},
      {'Medical Evacuation': medicalEvacuation},
      {'Emergency DentalCare': emergencyDentalCare},
      {'Treatment For InPatientCare': treatmentForInPatientCare},
      {'MentalHealth': mentalHealth},
      {'PrescriptionDrugs': prescriptionDrugs},

    ];
  }
}

String coverageToString(Coverage coverage) {
  return (coverage == Coverage.Covered) ? 'Covered' : 'Assistance only';
}

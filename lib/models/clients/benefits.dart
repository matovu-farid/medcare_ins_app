//enum Coverage { AssistanceOnly, Covered }

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'benefits.g.dart';

@JsonSerializable()
class Benefits {
  final int hospitalizationInsurance;
  final int tripsToEmergencyRoom;
  final int medicalEvacuation;
  final int emergencyDentalCare;
  final int treatmentForInPatientCare;
  final int mentalHealth;
  final int prescriptionDrugs;

  Benefits(
      {this.hospitalizationInsurance,
      this.tripsToEmergencyRoom,
      this.medicalEvacuation,
      this.emergencyDentalCare,
      this.treatmentForInPatientCare,
      this.mentalHealth,
      this.prescriptionDrugs});

  factory Benefits.fromJson(Map<String, dynamic> json) =>
      _$BenefitsFromJson(json);

  Map<String, dynamic> toJson() => _$BenefitsToJson(this);

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

@JsonSerializable()
class InPatientBenefits {
  final int illnessHospitalization;
  final int accidentalHospitalization;
  final int iCU;
  final int ambulanceServices;
  final int chronicsInPatient;
  final int gynecologicalSurvey;
  final int generalSurvey;
  final int maternity;
  final int funeral;

  InPatientBenefits({
    @required this.illnessHospitalization,
    @required this.accidentalHospitalization,
    @required this.iCU,
    @required this.ambulanceServices,
    @required this.chronicsInPatient,
    @required this.gynecologicalSurvey,
    @required this.generalSurvey,
    @required this.maternity,
    @required this.funeral,
  });

  factory InPatientBenefits.fromJson(Map<String, dynamic> json) =>
      _$InPatientBenefitsFromJson(json);

  Map<String, dynamic> toJson() => _$InPatientBenefitsToJson(this);

  @override
  String toString() {
    return 'InPatientBenefits{illnessHospitalization: $illnessHospitalization, accidentalHospitalization: $accidentalHospitalization, iCU: $iCU, ambulanceServices: $ambulanceServices, chronicsInPatient: $chronicsInPatient, gynecologicalSurvey: $gynecologicalSurvey, generalSurvey: $generalSurvey, maternity: $maternity, funeral: $funeral}';
  }

  List<Map<String, dynamic>> toList() {
    return [
      {'Hospitalization Insurance': illnessHospitalization},
      {'Trips To EmergencyRoom': accidentalHospitalization},
      {'Medical Evacuation': iCU},
      {'Emergency DentalCare': ambulanceServices},
      {'Treatment For InPatientCare': chronicsInPatient},
      {'MentalHealth': gynecologicalSurvey},
      {'PrescriptionDrugs': generalSurvey},
    ];
  }
}

@JsonSerializable()
class OutPatientBenefits {
  final int outPatientGeneral;
  final int dental;
  final int optical;
  final int chronicsOutPatient;
  final int annualWellness;

  OutPatientBenefits({
    @required this.outPatientGeneral,
    @required this.dental,
    @required this.optical,
    @required this.chronicsOutPatient,
    @required this.annualWellness,
  });

  factory OutPatientBenefits.fromJson(Map<String, dynamic> json) =>
      _$OutPatientBenefitsFromJson(json);

  Map<String, dynamic> toJson() => _$OutPatientBenefitsToJson(this);

  @override
  String toString() {
    return 'OutPatientBenefits{outPatientGeneral: $outPatientGeneral, dental: $dental, optical: $optical, chronicsOutPatient: $chronicsOutPatient, annualWellness: $annualWellness}';
  }
}

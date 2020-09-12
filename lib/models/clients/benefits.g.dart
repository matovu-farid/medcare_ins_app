// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'benefits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Benefits _$BenefitsFromJson(Map<String, dynamic> json) {
  return Benefits(
    hospitalizationInsurance: json['hospitalizationInsurance'] as int,
    tripsToEmergencyRoom: json['tripsToEmergencyRoom'] as int,
    medicalEvacuation: json['medicalEvacuation'] as int,
    emergencyDentalCare: json['emergencyDentalCare'] as int,
    treatmentForInPatientCare: json['treatmentForInPatientCare'] as int,
    mentalHealth: json['mentalHealth'] as int,
    prescriptionDrugs: json['prescriptionDrugs'] as int,
  );
}

Map<String, dynamic> _$BenefitsToJson(Benefits instance) => <String, dynamic>{
      'hospitalizationInsurance': instance.hospitalizationInsurance,
      'tripsToEmergencyRoom': instance.tripsToEmergencyRoom,
      'medicalEvacuation': instance.medicalEvacuation,
      'emergencyDentalCare': instance.emergencyDentalCare,
      'treatmentForInPatientCare': instance.treatmentForInPatientCare,
      'mentalHealth': instance.mentalHealth,
      'prescriptionDrugs': instance.prescriptionDrugs,
    };

InPatientBenefits _$InPatientBenefitsFromJson(Map<String, dynamic> json) {
  return InPatientBenefits(
    illnessHospitalization: json['illnessHospitalization'] as int,
    accidentalHospitalization: json['accidentalHospitalization'] as int,
    iCU: json['iCU'] as int,
    ambulanceServices: json['ambulanceServices'] as int,
    chronicsInPatient: json['chronicsInPatient'] as int,
    gynecologicalSurvey: json['gynecologicalSurvey'] as int,
    generalSurvey: json['generalSurvey'] as int,
    maternity: json['maternity'] as int,
    funeral: json['funeral'] as int,
  );
}

Map<String, dynamic> _$InPatientBenefitsToJson(InPatientBenefits instance) =>
    <String, dynamic>{
      'illnessHospitalization': instance.illnessHospitalization,
      'accidentalHospitalization': instance.accidentalHospitalization,
      'iCU': instance.iCU,
      'ambulanceServices': instance.ambulanceServices,
      'chronicsInPatient': instance.chronicsInPatient,
      'gynecologicalSurvey': instance.gynecologicalSurvey,
      'generalSurvey': instance.generalSurvey,
      'maternity': instance.maternity,
      'funeral': instance.funeral,
    };

OutPatientBenefits _$OutPatientBenefitsFromJson(Map<String, dynamic> json) {
  return OutPatientBenefits(
    outPatientGeneral: json['outPatientGeneral'] as int,
    dental: json['dental'] as int,
    optical: json['optical'] as int,
    chronicsOutPatient: json['chronicsOutPatient'] as int,
    annualWellness: json['annualWellness'] as int,
  );
}

Map<String, dynamic> _$OutPatientBenefitsToJson(OutPatientBenefits instance) =>
    <String, dynamic>{
      'outPatientGeneral': instance.outPatientGeneral,
      'dental': instance.dental,
      'optical': instance.optical,
      'chronicsOutPatient': instance.chronicsOutPatient,
      'annualWellness': instance.annualWellness,
    };

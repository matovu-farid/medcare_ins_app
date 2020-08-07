


class History{
  final PatientInfo patientInfo;
  final MedicalInfo medicalInfo;
  final Clarification clarification;

  History({this.patientInfo, this.medicalInfo, this.clarification});

}

class MedicalInfo {
  final String natureOfillness;
  final String diagnosis;
  final String condition;
  final int consultationFee;
  final List<Map<String,int>> hospitalServices;
  final List<Map<String,String>> results;

  MedicalInfo({this.natureOfillness, this.diagnosis, this.condition,
      this.consultationFee, this.hospitalServices, this.results});

}

class Clarification {
  final String doctorsName;
  final String doctorsQualification;

  Clarification({this.doctorsName, this.doctorsQualification});


}

class PatientInfo {
  final String patientName;
  final String relationship;
  final String medicalCardNo;
  final String gender;
  final DateTime dateOfBirth;



  PatientInfo({this.patientName, this.relationship, this.medicalCardNo, this.gender, this.dateOfBirth});


}
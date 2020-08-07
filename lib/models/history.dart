


class History{
  final PatientInfo patientInfo;
  final MedicalInfo medicalInfo;
  final Clarification clarification;

  History({this.patientInfo, this.medicalInfo, this.clarification});

  @override
  String toString() {
    return 'History{patientInfo: $patientInfo, medicalInfo: $medicalInfo, clarification: $clarification}';
  }
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

  @override
  String toString() {
    return 'MedicalInfo{natureOfillness: $natureOfillness, diagnosis: $diagnosis, condition: $condition, consultationFee: $consultationFee, hospitalServices: $hospitalServices, results: $results}';
  }
}

class Clarification {
  final String doctorsName;
  final String doctorsQualification;

  Clarification({this.doctorsName, this.doctorsQualification});

  @override
  String toString() {
    return 'Clarification{doctorsName: $doctorsName, doctorsQualification: $doctorsQualification}';
  }
}

class PatientInfo {
  final String patientName;
  final String relationship;
  final String medicalCardNo;
  final String gender;
  final String dateOfBirth;



  PatientInfo({this.patientName, this.relationship, this.medicalCardNo, this.gender, this.dateOfBirth});

  @override
  String toString() {
    return 'PatientInfo{patientName: $patientName, relationship: $relationship, medicalCardNo: $medicalCardNo, gender: $gender, dateOfBirth: $dateOfBirth}';
  }
}
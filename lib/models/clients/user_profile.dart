import 'package:medicalApp/models/client_company_model/client_company_model.dart';
import 'package:mock_data/mock_data.dart';

enum Gender { Male, Female }

String createImagePath() {
  return 'images/profile_images/${mockInteger(1, 9)}.jpg';
}

class UserProfile {
  final ClientCompany company;
  final String occupation;
  final String gender;
  final String dateOfBirth;
  final String bloodType;
  final String email;
  final String address;
  final String name;
  String likability;
  String imagePath;
  final String regDate;
  final String holderStatus;
  final String phoneNumber;

  UserProfile(
      {this.holderStatus,
      this.regDate,
      this.likability = 'Dislike',
      this.name,
      this.company,
      this.phoneNumber,
      this.occupation,
      this.gender,
      this.dateOfBirth,
      this.bloodType,
      this.email,
      this.address})
      : this.imagePath = createImagePath();

  @override
  String toString() {
    return 'UserProfile{company: $company, occupation: $occupation, gender: $gender, dateOfBirth: $dateOfBirth, bloodType: $bloodType, email: $email, address: $address}';
  }

  List<Map<String, String>> toList() {
    return [
      {'Company': company.companyName},
      {'Occupation': occupation},
      {'Phone number': phoneNumber},
      {'DOB': dateOfBirth},
      {'BloodType': bloodType},
      {'Email': email},
      {'Address': address},
    ];
  }
}

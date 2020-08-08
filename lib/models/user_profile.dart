import 'package:mock_data/mock_data.dart';

enum Gender { Male, Female }

String createImagePath() {
  return 'images/profile_images/${mockInteger(1, 9)}.jpg';
}

class UserProfile {
  final String company;
  final String occupation;
  final String gender;
  final String dateOfBirth;
  final String bloodType;
  final String email;
  final String address;
  final String name;
  String likability;
  String imagePath;

  UserProfile(
      {
      this.likability = 'Dislike',
      this.name,
      this.company,
      this.occupation,
      this.gender,
      this.dateOfBirth,
      this.bloodType,
      this.email,
      this.address}):this.imagePath = createImagePath();

  @override
  String toString() {
    return 'UserProfile{company: $company, occupation: $occupation, gender: $gender, dateOfBirth: $dateOfBirth, bloodType: $bloodType, email: $email, address: $address}';
  }
}

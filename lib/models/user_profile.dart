enum Gender{
  Male,Female
}
class UserProfile{
  final String company;
  final String occupation;
  final String gender;
  final DateTime dateOfBirth;
  final String bloodType;
  final String email;
  final String address;

  UserProfile({this.company, this.occupation, this.gender, this.dateOfBirth, this.bloodType, this.email, this.address});


}
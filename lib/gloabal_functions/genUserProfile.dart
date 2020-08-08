

import 'package:medicalApp/models/user_profile.dart';
import 'package:mock_data/mock_data.dart';

import 'genHistory.dart';

UserProfile generateUserProfile(){
  return UserProfile(
      gender: _generateGender(),
      dateOfBirth: generateDate(),
      occupation: _generateOccupation(),
      email: _generateEmail(),
      bloodType: _generateBloodType(),
      address: _generateAddress(),
    name: generateName(),
    company: _generateCompany()

  );

}
String _generateCompany(){
  List<String> relationShips = ['Jubilee Life Insuraance','AAR Health Services','None','Case MedCare','IAA Heath Care','Life Link'];
  return relationShips[mockInteger(0,relationShips.length-1)];}
String _generateGender(){
  List<String> relationShips = ['male','female'];
  return relationShips[mockInteger(0,relationShips.length-1)];}
String _generateBloodType(){
  List<String> relationShips = ['A+','B+','AOB','O+','O-','A-','B-'];
  return relationShips[mockInteger(0,relationShips.length-1)];}
String _generateEmail(){
  List<String> relationShips = ['@yahoo.com','@gmail.com','@hotmail.com','@faridmail.com'];
  return '${mockName()}${relationShips[mockInteger(0,relationShips.length-1)]}';}
String _generateOccupation(){
  List<String> relationShips = ['engineer','plumber','electrician','accountant'];
  return relationShips[mockInteger(0,relationShips.length-1)];}
  String _generateAddress(){
  List<String> relationShips = ['Kampala','Mbale','Wakiso','Mbarara','Torroro'];
  return relationShips[mockInteger(0,relationShips.length-1)];}



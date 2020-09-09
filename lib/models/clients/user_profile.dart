import 'package:json_annotation/json_annotation.dart';
import 'package:medicalApp/models/client_company_model/client_company_model.dart';
import 'package:mock_data/mock_data.dart';
import 'package:flutter/material.dart';
part 'user_profile.g.dart';

enum Gender { Male, Female }

String createImagePath() {
  return 'images/profile_images/${mockInteger(1, 9)}.jpg';
}

@JsonSerializable()
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
  dynamic imageWidget;
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

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

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

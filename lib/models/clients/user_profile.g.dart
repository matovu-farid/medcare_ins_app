// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile(
    name: json['name'] as String,
    company: json['company'] == null
        ? null
        : ClientCompany.fromJson(json['company'] as Map<String, dynamic>),
    phoneNumber: json['phoneNumber'] as String,
    occupation: json['occupation'] as String,
    email: json['email'] as String,
    holderStatus: json['holderStatus'] as String,
    gender: json['gender'] as String,
    dateOfBirth: json['dateOfBirth'] as String,
    address: json['address'] as String,
    regDate: json['regDate'] as String,
    bloodType: json['bloodType'] as String,
  )
    ..imagePath = json['imagePath'] as String
    ..imageWidget = json['imageWidget'];
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'company': instance.company,
      'occupation': instance.occupation,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'bloodType': instance.bloodType,
      'email': instance.email,
      'address': instance.address,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'imageWidget': instance.imageWidget,
      'regDate': instance.regDate,
      'holderStatus': instance.holderStatus,
      'phoneNumber': instance.phoneNumber,
    };

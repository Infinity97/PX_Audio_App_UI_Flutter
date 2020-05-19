// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) {
  return Users(
    userId: json['userId'] as String,
    mobileNumber: json['mobileNumber'] as String,
    name: json['name'] as String,
    emailId: json['emailId'] as String,
    photoUrl: json['photoUrl'] as String,
    userType: json['userType'],
    referralCode: json['referralCode'] as String,
  );
}

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'userId': instance.userId,
      'mobileNumber': instance.mobileNumber,
      'name': instance.name,
      'emailId': instance.emailId,
      'photoUrl': instance.photoUrl,
      'userType': instance.userType,
      'referralCode': instance.referralCode,
    };

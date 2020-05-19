import 'package:flutter_ecommerce_youtube/src/utils/enums/user_type_enum.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable()
class Users{
  final String userId;
  final String mobileNumber;
  final String name;
  final String emailId;
  final String photoUrl;
  final UserType userType;
  final String referralCode;
  Users({this.userId, this.mobileNumber, this.name,this.emailId, this.photoUrl, this.userType, this.referralCode});

  @override
  List<Object> get props =>[userId,mobileNumber,name,emailId,photoUrl,userType,referralCode];

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;

class UsersRequest{

 String id;
 String name;
 String emailId;

 UsersRequest({this.id,this.name,this.emailId});

 factory UsersRequest.fromJson(List<dynamic> json){
   Map<String, dynamic> map = json[0];
   UsersRequest usersRequest =  UsersRequest(
     id: map["id"] as String,
     name: map["name"] as String,
     emailId: map["emailId"] as String,
   );
   String id = usersRequest.id;
   developer.log('The output is $id');
   return usersRequest;
 }

 Map toMap(){
   var map = new Map<String, dynamic>();
   map["name"] = name;
   map["emailId"] = emailId;
 }
}
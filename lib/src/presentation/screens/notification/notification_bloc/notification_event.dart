import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class GetListOfNotification extends NotificationEvent{
  final String userId;
  GetListOfNotification({@required this.userId});

  @override
  List<Object> get props => [userId];}

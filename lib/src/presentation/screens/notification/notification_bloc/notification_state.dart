import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_youtube/src/domain/dto/request/notification_request_entity.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();
}

class InitialNotificationState extends NotificationState {
  @override
  List<Object> get props => [];
}

class LoadingNotificationState extends NotificationState {
  @override
  List<Object> get props => [];
}

class LoadedNotificationState extends NotificationState{
  final NotificationRequestEntity notificationRequestEntity;
  LoadedNotificationState({@required this.notificationRequestEntity});

  @override
  List<Object> get props => [notificationRequestEntity];
}

class ErrorNotificationState extends NotificationState{
  String message;
  ErrorNotificationState({@required this.message});

  @override
  List<Object> get props => [message];
}
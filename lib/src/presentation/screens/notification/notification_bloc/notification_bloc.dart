import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_youtube/src/data/repository/notifications_repository.dart';
import 'package:flutter_ecommerce_youtube/src/domain/dto/request/notification_request_entity.dart';
import 'package:flutter_ecommerce_youtube/src/utils/static_info/dummy_data.dart';
import './bloc.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationsRepository notificationsRepository;
  NotificationBloc({@required this.notificationsRepository});

  @override
  NotificationState get initialState => InitialNotificationState();

  @override
  Stream<NotificationState> mapEventToState(
    NotificationEvent event,
  ) async* {
    yield LoadingNotificationState();
    if(event is GetListOfNotification){
      try{
          //final NotificationRequestEntity notificationRequestEntity = await notificationsRepository.getListOfNotifications(event.userId);
          NotificationRequestEntity notificationRequestEntity = DummyData.getListOfNotifications();
          yield LoadedNotificationState(notificationRequestEntity: notificationRequestEntity);
      }catch(Exception){
        yield ErrorNotificationState(message : "Could Not Load Information");
      }
    }
  }
}

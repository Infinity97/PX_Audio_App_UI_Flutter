import 'package:flutter_ecommerce_youtube/src/domain/dto/request/notification_request_entity.dart';

abstract class NotificationsRepository{
  Future<NotificationRequestEntity> getListOfNotifications(String userId);
}
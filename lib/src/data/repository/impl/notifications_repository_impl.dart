import 'package:flutter_ecommerce_youtube/src/data/repository/notifications_repository.dart';
import 'package:flutter_ecommerce_youtube/src/domain/controllers/notifications_controller.dart';
import 'package:flutter_ecommerce_youtube/src/domain/dto/request/notification_request_entity.dart';

class NotificationRepositoryImpl implements NotificationsRepository{
  NotificationsController _notificationsController;

  @override
  Future<NotificationRequestEntity> getListOfNotifications(String userId) async {
    final response = _notificationsController.getListOfNotifications(userId);
    return response;
  }

}
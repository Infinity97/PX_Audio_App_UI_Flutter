import 'package:flutter_ecommerce_youtube/src/domain/dto/request/notification_request_entity.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/api_provider/api_provider.dart';
import 'package:flutter_ecommerce_youtube/src/utils/constants.dart';

class NotificationsController{
  ApiProvider _apiProvider = ApiProvider();
  NotificationRequestEntity notificationRequestEntity;

  Future<NotificationRequestEntity> getListOfNotifications(String userId) async{
      final response = await _apiProvider.get(Constants.NOTIFICATIONS+Constants.GET_LIST_OF_NOTIFICATIONS);
      return notificationRequestEntity.fromJson(response);
  }

}
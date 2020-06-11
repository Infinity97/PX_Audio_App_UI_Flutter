import 'package:flutter_ecommerce_youtube/generated/json/base/json_convert_content.dart';

class NotificationRequestEntity with JsonConvert<NotificationRequestEntity> {
	int notificationCount;
	List<NotificationRequestListOfNotification> listOfNotification;
	NotificationRequestEntity({this.notificationCount, this.listOfNotification});
}

class NotificationRequestListOfNotification with JsonConvert<NotificationRequestListOfNotification> {
	String title;
	String notificationType;
	String callToActionTextLeft;
	String callToActionTextRight;
	String date;
	String imageUrl;
	String description;

	NotificationRequestListOfNotification({this.title, this.notificationType,
			this.callToActionTextLeft, this.callToActionTextRight, this.date,
			this.imageUrl, this.description});
}


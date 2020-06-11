import 'dart:math';

import 'package:flutter_ecommerce_youtube/src/domain/dto/request/notification_request_entity.dart';

notificationRequestEntityFromJson(NotificationRequestEntity data, Map<String, dynamic> json) {
	if (json['notificationCount'] != null) {
		data.notificationCount = json['notificationCount'];
	}
	if (json['listOfNotification'] != null) {
		data.listOfNotification = new List<NotificationRequestListOfNotification>();
		(json['listOfNotification'] as List).forEach((v) {
			data.listOfNotification.add(new NotificationRequestListOfNotification().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> notificationRequestEntityToJson(NotificationRequestEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['notificationCount'] = entity.notificationCount;
	if (entity.listOfNotification != null) {
		data['listOfNotification'] =  entity.listOfNotification.map((v) => v.toJson()).toList();
	}
	return data;
}

notificationRequestListOfNotificationFromJson(NotificationRequestListOfNotification data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['notificationType'] != null) {
		data.notificationType = json['notificationType']?.toString();
	}
	if (json['callToActionTextLeft'] != null) {
		data.callToActionTextLeft = json['callToActionTextLeft']?.toString();
	}
	if (json['callToActionTextRight'] != null) {
		data.callToActionTextRight = json['callToActionTextRight']?.toString();
	}
	if (json['date'] != null) {
		data.date = json['date']?.toString();
	}
	if (json['imageUrl'] != null) {
		data.imageUrl = json['imageUrl']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	return data;
}

Map<String, dynamic> notificationRequestListOfNotificationToJson(NotificationRequestListOfNotification entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['notificationType'] = entity.notificationType;
	data['callToActionTextLeft'] = entity.callToActionTextLeft;
	data['callToActionTextRight'] = entity.callToActionTextRight;
	data['date'] = entity.date;
	data['imageUrl'] = entity.imageUrl;
	data['description'] = entity.description;
	return data;
}
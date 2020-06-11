enum NotificationType{
  Marketing, // Title , Image, Order Now
  Order, // Title,
  Service,
}

extension NotificationTypeExtensions on NotificationType{
  
  static NotificationType getEnum(String value){
    value = value.toLowerCase().trim();
    switch(value){
      case "marketing":
        return NotificationType.Marketing;
        break;
      case "service":
        return NotificationType.Service;
        break;
      case "order":
        return NotificationType.Order;
        break;
      default:
        return null;
  }
}
  
}
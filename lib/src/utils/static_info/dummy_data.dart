import 'package:flutter_ecommerce_youtube/main.dart';
import 'package:flutter_ecommerce_youtube/src/data/models/product.dart';
import 'package:flutter_ecommerce_youtube/src/domain/dto/request/notification_request_entity.dart';
import 'package:flutter_ecommerce_youtube/src/domain/dto/request/test.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/horizontal_container_widget.dart';
import 'package:flutter_ecommerce_youtube/src/utils/constants.dart';

class DummyData {

  static NotificationRequestEntity getListOfNotifications() {
    List<NotificationRequestListOfNotification> listOfNotification = [
      NotificationRequestListOfNotification(
          title: "Dummy Data",
          notificationType: "Marketing",
          callToActionTextLeft: "Get Details",
          date: "Fri, 27 May 2020 12:00",
          imageUrl: imgList[0]),
      NotificationRequestListOfNotification(
          title: "Dummy Data",
          notificationType: "Service",
          callToActionTextLeft: "Accept",
          callToActionTextRight: "Deny",
          date: "Fri, 27 May 2020 12:00",
          imageUrl: imgList[0]),
      NotificationRequestListOfNotification(
          title: "Dummy Data",
          notificationType: "Order",
          callToActionTextLeft: "Get Details",
          date: "Fri, 27 May 2020 12:00",
          imageUrl: imgList[0]),
    ];
    return NotificationRequestEntity(
        notificationCount: 3, listOfNotification: listOfNotification);
  }

  static Product getProduct(){
    return new Product(
        productId: "1",
        productName: "Test",
        productDescription: "Testing 2",
        imageUrl:Constants.imgList[1],
        price: 2000,
        rating: 4.0,
    numberOfUsersRated: 200,
    productDetailedDescription: "sdoijf oisdjf osdjf osdijfosijd fosdj fosjdfoijsdof jsdoifj osdjf osdjf osdjfoi isdjf o",
    category: "Test");
  }

  static List<Product> getListOfProduct() {
    Product productTemp = getProduct();
    List<Product> productListTemp = List.generate(5, (index) => productTemp);
    return productListTemp;
  }

  static List<EncapsulatedWidget> getListOfEncapsulatedWidgets(){
    EncapsulatedWidget encapsulatedWidget = EncapsulatedWidget(header: "Dummy Data",);
    return List.generate(5, (index) => encapsulatedWidget);
  }

}

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/notification/notification_screen.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/size_config.dart';

class NotificationBadgeWidget extends StatelessWidget {
  final int numberOfNotification;
  NotificationBadgeWidget({Key key, this.numberOfNotification}):super(key:key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return
      Container(
          padding: EdgeInsets.fromLTRB(0, 13, 5, 0),
          child: Stack(children: <Widget>[GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()));
            },
            child: Icon(
              Icons.notifications,
              size: SizeConfig.blockSizeVertical * 4,
            ),
          ),
            numberOfNotification > 0?Positioned(
              right: 0,
              top: 0,
              child: new Container(
                padding: EdgeInsets.all(2),
                decoration: new BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: BoxConstraints(
                  minWidth: 14,
                  minHeight: 14,
                ),
                child: Text(
                  '$numberOfNotification',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ) : new Container()
          ]));
  }
}

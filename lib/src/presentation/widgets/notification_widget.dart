import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/main.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/image_carousel_widget.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/independent/tile_widget.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/enums/image_slider_type.dart';
import 'package:flutter_ecommerce_youtube/src/utils/enums/notification_type.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationType notificationType;
  final String title;
  final String description;
  final String imageUrl;
  final String callToActionTextLeft;
  final String callToActionTextRight;
  final String date;
  final Function onTap;
  NotificationWidget(
      {Key key,
      @required this.notificationType,
      @required this.title,
      @required this.date,
      this.description,
      this.imageUrl,
      this.callToActionTextLeft,
      this.callToActionTextRight,
      this.onTap})
      : super(key: key);

  Widget displayBody() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: TileWidget(
        onTap: null,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                date,
                style: TextStyle(
                  color: ColorConstants.darkgrey,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * .5,
              ),
              Text(
                title,
                style: TextStyle(
                    color: ColorConstants.gradientOrangeEnd,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * .5,
              ),
              imageUrl != null
                  ? Container(
                      child: Image(
                        image: NetworkImage(imageUrl),
                        width: SizeConfig.blockSizeHorizontal * 90,
                        height: SizeConfig.blockSizeVertical * 20,
                        fit: BoxFit.fitWidth,
                      ),
                    )
                  : Container(),
              SizedBox(
                height: SizeConfig.blockSizeVertical * .5,
              ),
              description != null
                  ? Text(
                      description,
                      style: TextStyle(
                          color: ColorConstants.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  : Container(),
              Divider(),
              callToActionTextLeft != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: SizeConfig.blockSizeHorizontal * 44,
                          child: InkWell(
                            child: Text(
                              callToActionTextLeft,
                              style: TextStyle(
                                  color: ColorConstants.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                            onTap: () {
                              print("left");
                            },
                          ),
                        ),
                        callToActionTextRight != null
                            ? Container(
                                width: SizeConfig.blockSizeHorizontal * 44,
                                child: InkWell(
                                  child: Text(
                                    callToActionTextRight,
                                    style: TextStyle(
                                        color: ColorConstants.red,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    textAlign: TextAlign.end,
                                  ),
                                  onTap: () {
                                    print("right");
                                  },
                                ),
                              )
                            : Container(),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return displayBody();
  }
}

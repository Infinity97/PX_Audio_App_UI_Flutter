import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/notification/notification_screen.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/search_bar.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String titleImageUrl;
  final String titleText;
  final bool showSearchIcon;
  final bool showCartIcon;
  final bool showNotificationsIcon;
  final bool showDrawer;

  AppBarWidget(
      {this.titleImageUrl,
      this.titleText,
      this.showCartIcon = false,
      this.showDrawer = false,
      this.showNotificationsIcon = false,
      this.showSearchIcon = false,
      Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AppBar(
      backgroundColor: ColorConstants.gradientOrangeEnd,
      title: titleText == null
          ? Center(
              child: Image(
                //image: NetworkImage(titleImageUrl),
                image: AssetImage('assets/PX_Audio_Logo.jpg'),
                height: SizeConfig.blockSizeVertical * 6,
              ),
            )
          : Center(
              child: Text(
                titleText,
                style: TextStyle(
                    color: ColorConstants.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 21),
                textAlign: TextAlign.center,
              ),
            ),
      actions: <Widget>[
        !showDrawer
            ? Container()
            : Container(),
        showSearchIcon
            ? Container(
                child: IconButton(
                  icon: Icon(Icons.search),
                  color: ColorConstants.white,
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchScreen())),
                ),
              )
            : Container(),
        showNotificationsIcon
            ? Container(
                child: IconButton(
                  icon: Icon(Icons.notifications),
                  color: ColorConstants.white,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen())),
                ),
              )
            : Container(),
        showCartIcon
            ? Container(
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  color: ColorConstants.white,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen())),
                ),
              )
            : Container(),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(48.0);
}

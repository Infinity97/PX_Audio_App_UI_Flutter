import 'package:flutter/material.dart';

class AppBarWidget extends AppBar {
  //final Text textWidget;
  //final List<Widget> actionWidgetList;
  List<Widget> getAppBarWidgetList(bool displaySearch, bool displayCart) {
    List<Widget> actionWidgetList = [];
    if (displaySearch)
      actionWidgetList.add(
        IconButton(
          icon: Icon(
            Icons.search,
          ),
          onPressed: () {
            print("1");
          },
        ),
      );
    if (displayCart)
      actionWidgetList.add(
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            print("2");
          },
        ),
      );
    return actionWidgetList;
  }

  AppBarWidget({Key key, Widget title, List<Widget> actionWidgetList})
      : super(key: key, title: title, actions: actionWidgetList, elevation: 0.0);
}

//import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_ecommerce_youtube/src/screens/language.dart';
//import 'package:flutter_ecommerce_youtube/src/screens/login_page.dart';
//import 'package:flutter_ecommerce_youtube/src/screens/signup.dart';
//import 'package:flutter_ecommerce_youtube/src/screens/welcome.dart';
//import 'package:flutter_ecommerce_youtube/src/theme/color_constants.dart';
//import 'package:flutter_ecommerce_youtube/src/utils/size_config.dart';
//import 'dart:developer' as developer;
//
//class BottomNavigationBarWidget extends StatefulWidget {
//  @override
//  _BottomNavigationBarWidgetState createState() =>
//      _BottomNavigationBarWidgetState();
//}
//
//class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
//  int currentPage = 0;
//  GlobalKey bottomNavigationKey = GlobalKey();
//  @override
//  Widget build(BuildContext context) {
//  SizeConfig().init(context);
//    return Container(
//        height: SizeConfig.blockSizeVertical*20,
//        child: FancyBottomNavigation(
//      circleColor: ColorConstants.orange,
//      textColor: ColorConstants.orange,
//      barBackgroundColor: ColorConstants.white,
//      inactiveIconColor: ColorConstants.orange,
//      tabs: [
//        TabData(iconData: Icons.home, title: "Home", onclick: () => Navigator.of(context)
//            .push(MaterialPageRoute(builder: (context) => WelcomePage()))),
//        TabData(iconData: Icons.add, title: "Home", onclick: () {developer.log("This is Button 2");}),
//        TabData(iconData: Icons.search, title: "Home", onclick: () {developer.log("This is Button 3");}),
//        TabData(iconData: Icons.email, title: "Home", onclick: () {developer.log("This is Button 4");}),
//      ],
//      initialSelection: 0,
//      key: bottomNavigationKey,
//      onTabChangedListener: (position) {
//        setState(() {
//          currentPage = position;
//        });
//      },
//    ));
//  }
//}
//
//class MyInheritedWidget extends InheritedWidget{
//
//  final int page;
//
//  MyInheritedWidget({this.page, Widget child}): super(child: child);
//
//  @override
//  bool updateShouldNotify(MyInheritedWidget oldWidget) {
//    return page!= oldWidget.page;
//  }
//
//
//
//}
//

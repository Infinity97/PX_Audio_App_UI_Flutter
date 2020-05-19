import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum BottomNavigationEnum{
  Home,
  Products,
  Invite,
  Service,
  Dashboard,
}

extension BottomNavigationExtensions on BottomNavigationEnum{
  Widget get name{
    switch (this){
      case BottomNavigationEnum.Home:
        return Text("Home", style: TextStyle(fontSize: 13),);
      case BottomNavigationEnum.Products:
        return Text("Products", style: TextStyle(fontSize: 13),);
      case BottomNavigationEnum.Invite:
        return Text("Invite & Earn", style: TextStyle(fontSize: 13),);
      case BottomNavigationEnum.Service:
        return Text("Service", style: TextStyle(fontSize: 13),);
      case BottomNavigationEnum.Dashboard:
        return Text("Dashboard", style: TextStyle(fontSize: 13),);
    }
  }
  Icon get icon{
    switch (this){
      case BottomNavigationEnum.Home:
        return Icon(Icons.home);
      case BottomNavigationEnum.Products:
        return Icon(Icons.category);
      case BottomNavigationEnum.Invite:
        return Icon(Icons.person_add);
      case BottomNavigationEnum.Service:
        return Icon(Icons.build);
      case BottomNavigationEnum.Dashboard:
        return Icon(Icons.dashboard);
    }
  }
}
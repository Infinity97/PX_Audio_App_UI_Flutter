import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';

class BarButton extends StatelessWidget {
  final String title;
  final Color gradientStart;
  final Color gradientEnd;
  final double height;
  final double width;
  final Function onPressed;
  final double fontSize;
  BarButton(
      {Key key,
        @required this.title,
        @required this.height,
        @required this.width,
        this.onPressed,
      this.gradientStart = ColorConstants.gradientOrangeStart,
      this.gradientEnd = ColorConstants.gradientOrangeEnd,
        this.fontSize,
     })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialButton(
      padding: EdgeInsets.all(3),
      onPressed: onPressed ?? (){},
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [gradientStart, gradientEnd]),
        ),
        child:
        //Row(children : <Widget>[
//          Image(
//            image: AssetImage('assets/PX_Audio_Logo.jpg'),
//            height: SizeConfig.blockSizeVertical * 5,
//            width: SizeConfig.blockSizeHorizontal*20,
//          ),
          Center(child: Text(
          title,
          style: TextStyle(
            color: ColorConstants.white,
            fontSize: fontSize
          ),
          textAlign: TextAlign.center,
        ),),

    ),);
  }
}

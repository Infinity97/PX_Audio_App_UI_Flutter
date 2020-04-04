//import 'dart:html';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/theme/color_constants.dart';
import 'package:flutter_ecommerce_youtube/src/theme/theme.dart';
import 'package:flutter_ecommerce_youtube/src/widgets/app_bar.dart';
import 'dart:developer' as developer;

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 20),
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          Image.network(
              'https://www.biography.com/.image/t_share/MTE5NDg0MDU0OTM2NTg1NzQz/tom-cruise-9262645-1-402.jpg'),
          Image.network(
              'http://www.coderzheaven.com/wp-content/uploads/2019/04/Carousel.png'),
          Image.network(
              'https://www.biography.com/.image/t_share/MTE5NDg0MDU0OTM2NTg1NzQz/tom-cruise-9262645-1-402.jpg'),
          Image.network(
              'http://www.coderzheaven.com/wp-content/uploads/2019/04/Carousel.png'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 2000),
        borderRadius: true,
        radius: Radius.elliptical(20, 20),
        dotSize: 4,
        dotSpacing: 15,
        indicatorBgPadding: 5,
      ),
    );
    return Scaffold(
      appBar: AppBarWidget(
        title: Center(
          child: Text(
            " PX AUDIO ",
            textAlign: TextAlign.center,
            style: AppTheme.titleStyle,
          ),
        ), // To add PX Audio Logo here
      ),
      body: ListView(
        children: <Widget>[
          imageCarousel,
          Center(
            child: Text(
              "Choose a Language",
              style: TextStyle(
                  decorationStyle: TextDecorationStyle.solid,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              onPressed: () {
                developer.log("English");
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
              ),
              color: Colors.red,
              textColor: Colors.white,
              child: Text(
                "ENGLISH",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              onPressed: () {
                developer.log("Hindi");
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
              ),
              padding: const EdgeInsets.all(0.0),
              child: Ink(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xff0d47a1),
                      Color(0xff1976d2),
                      Color(0xff42A5F5),
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(80.0)),
                ),
                child: Container(
                  constraints: const BoxConstraints(
                      minWidth: 88.0,
                      minHeight: 36.0), // min sizes for Material buttons
                  alignment: Alignment.center,
                  child: const Text(
                    'HINDI',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              textColor: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              onPressed: () {
                developer.log("Bengali");
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
              ),
              color: Colors.red,
              textColor: Colors.white,
              child: Text(
                "BENGALI",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

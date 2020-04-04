import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/screens/home_page.dart';
import 'package:flutter_ecommerce_youtube/src/screens/language.dart';
import 'package:flutter_ecommerce_youtube/src/screens/loginPage.dart';
import 'package:flutter_ecommerce_youtube/src/screens/signup.dart';
import 'package:flutter_ecommerce_youtube/src/screens/welcome.dart';
import 'package:flutter_ecommerce_youtube/src/theme/theme.dart';
import 'package:flutter_ecommerce_youtube/src/widgets/app_bar.dart';
import 'package:flutter_ecommerce_youtube/src/widgets/drawer.dart';
import './src/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
      theme: AppTheme.lightTheme.copyWith(
          textTheme: GoogleFonts.muliTextTheme(
              Theme.of(context).textTheme),
      ),
    );
  }
}

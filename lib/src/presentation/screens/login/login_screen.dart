import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';
import 'dart:developer' as developer;

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(
        context); // Initialize the entire size of the Application by dividing things into blocks.
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 4,
              vertical: SizeConfig.blockSizeVertical),
          height: SizeConfig.blockSizeVertical * 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2),
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorConstants.gradientOrangeStart,
                  ColorConstants.gradientOrangeEnd
                ]),
          ),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _title(),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  _imageCarousel(),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                 // _loginSignUpBox(),
                ],
              ),
              // showOtpScreen ? _otpScreen(context): Container(width: 0, height: 0,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Image(
            image: AssetImage('assets/PX_Audio_Logo.jpg'),
            height: SizeConfig.blockSizeVertical * 5,
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              developer.log("Pressed Skip");
            },
            child: Text(
              "SKIP",
              style: TextStyle(
                  color: ColorConstants.black,
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.safeBlockHorizontal * 5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _imageCarousel() {
    //TODO: Adding the right images in the carousel.
    return new Container(
      height: SizeConfig.blockSizeVertical * 20,
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
        animationDuration: Duration(milliseconds: 1000),
        overlayShadowColors: Colors.green,
        overlayShadowSize: 0.1,
        showIndicator: false,
        borderRadius: false,
      ),
    );
  }

}

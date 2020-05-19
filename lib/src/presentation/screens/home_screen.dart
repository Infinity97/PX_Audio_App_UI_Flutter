import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/data/models/users/users.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/bar_button.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/horizontal_container_widget.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/image_carousel_widget.dart';
import 'package:flutter_ecommerce_youtube/src/utils/enums/image_slider_type.dart';
import 'package:flutter_ecommerce_youtube/src/utils/helper.dart';
import 'package:flutter_ecommerce_youtube/src/utils/size_config.dart';
import 'dart:developer' as developer;

class HomeScreen extends StatefulWidget {
  Users users = new Users();

  HomeScreen({this.users, Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
      return SingleChildScrollView(child: Container(
        padding: Helper.symmetryPadding(),
          //height: SizeConfig.blockSizeVertical * 100,
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ImageCarouselWidget(type: ImageCarouselType.ImageSlider,),
                  Helper.backgroundText(text: "Categories"),
//                  SizedBox(
//                    height: SizeConfig.blockSizeVertical*3,
//                  ),
                  CategoryBarWidget(),
                  //Helper.backgroundText(text: "Top Rated"),
//                  Column(
//                    children: <Widget>[
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        children: <Widget>[ProductCardWidget(),SizedBox(width: SizeConfig.blockSizeHorizontal*5,),ProductCardWidget()],
//                      )
//                    ],
//      )
                EncapsulatedWidget(header: "Top Rated",),
                SizedBox(height: SizeConfig.blockSizeVertical,),
                EncapsulatedWidget(header: "Categories",),
                ],
              )
            ],
          ),
        ),);
  }
}

class CategoryBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical * 8,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          BarButton(
            title: "Power Amplifiers",
            height: SizeConfig.blockSizeVertical * 8,
            width: SizeConfig.blockSizeHorizontal * 50,
          ),
          BarButton(
            title: "Audio Speakers",
            height: SizeConfig.blockSizeVertical * 8,
            width: SizeConfig.blockSizeHorizontal * 50,
          ),
          BarButton(
            title: "Public Address Amplifiers",
            height: SizeConfig.blockSizeVertical * 8,
            width: SizeConfig.blockSizeHorizontal * 50,
          ),
          BarButton(
            title: "Driver Units",
            height: SizeConfig.blockSizeVertical * 8,
            width: SizeConfig.blockSizeHorizontal * 50,
          ),
        ],
      ),
    );
  }
}

//TODO: Already Bought a Product? Claim Warranty here:-

//TODO:
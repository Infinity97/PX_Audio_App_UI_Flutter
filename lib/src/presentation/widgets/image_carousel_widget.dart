import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/utils/constants.dart';
import 'package:flutter_ecommerce_youtube/src/utils/enums/image_slider_type.dart';
import 'package:flutter_ecommerce_youtube/src/utils/size_config.dart';

final List<Widget> imageSliders = Constants.imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class ImageCarouselWidget extends StatefulWidget {
  ImageCarouselType type;

  ImageCarouselWidget({@required this.type, Key key}) : super(key: key);

  @override
  _ImageCarouselWidgetState createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {
  int _current = 0;

  Widget _imageSliderFunction(ImageCarouselType type) {
    switch (type.index) {
      case 0:
        return Container(
            child: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 1),
                autoPlayAnimationDuration: Duration(seconds: 1),
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imageSliders,
            ),
          ],
        ));
      case 1:
        return Builder(
          builder: (context) {
            final double height = SizeConfig.blockSizeVertical * 70;
            return CarouselSlider(
              options: CarouselOptions(
                height: height,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: false,
              ),
              items: Constants.imgList
                  .map((item) => Container(
                        child: Center(
                            child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          height: height,
                        )),
                      ))
                  .toList(),
            );
          },
        );
      case 2:
        return Container(
            child: CarouselSlider(
              options: CarouselOptions(height: SizeConfig.blockSizeVertical*25),
              items: Constants.imgList
                  .map((item) => Container(
                child: Center(
                    child:
                    Image.network(item, fit: BoxFit.cover, width: SizeConfig.blockSizeHorizontal*100)),
              ))
                  .toList(),
            ));
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return _imageSliderFunction(widget.type);
  }
}

// TODO: Populate Image Lists from the DB call and not from static image.

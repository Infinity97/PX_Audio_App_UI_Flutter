import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/data/models/product.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/static_info/dummy_data.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingsWidget extends StatelessWidget {
  Product product;
  double height;
  double width;
  RatingsWidget({@required this.product, this.height, this.width, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: ONLY FOR TESTING REMOVE LATER
    product = DummyData.getProduct();
    bool _isNumberOfUsersAvailable =
        product.numberOfUsersRated != null ? true : false;

    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: ColorConstants.brightGreen,
      ),
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical*.5,
          horizontal: SizeConfig.blockSizeHorizontal),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: product.rating.toString(),
              style: TextStyle(color: ColorConstants.white, fontSize: 14),
            ),
            WidgetSpan(
              child: Icon(
                Icons.star,
                size: 16,
                color: ColorConstants.white,
              ),
            ),
            _isNumberOfUsersAvailable
                ? TextSpan(
                    text: " | " +
                        product.numberOfUsersRated.toString().substring(0,
                            product.numberOfUsersRated.toString().indexOf('.')),
                    style: TextStyle(color: ColorConstants.white, fontSize: 14),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class RatingsBarWidget extends StatelessWidget {
  double ratingValue;

  RatingsBarWidget({@required this.ratingValue, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return RatingBar(
      initialRating: 5,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding:
          EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal * 2),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: ColorConstants.gradientOrangeEnd,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}

class RatingBarIndicatorWidget extends StatelessWidget {
  double ratingValue;
  RatingBarIndicatorWidget({this.ratingValue, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(children: <Widget>[
      RatingBarIndicator(
        rating: ratingValue,
        itemSize: SizeConfig.blockSizeHorizontal * 5,
        itemBuilder: (context, index) => Icon(
          Icons.star,
          color: ColorConstants.gradientOrangeEnd,
        ),
        itemCount: 5,
        direction: Axis.horizontal,
      ),
      SizedBox(width: SizeConfig.blockSizeHorizontal,),
      Text(ratingValue.toString() + " out of 5", style: TextStyle(color: ColorConstants.black, fontSize: SizeConfig.blockSizeHorizontal*4),),
    ],
    );
  }
}

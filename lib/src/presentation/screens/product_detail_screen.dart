import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/data/models/product.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/horizontal_container_widget.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/image_carousel_widget.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/ratings_widget.dart';
import 'package:flutter_ecommerce_youtube/src/utils/constants.dart';
import 'package:flutter_ecommerce_youtube/src/utils/enums/image_slider_type.dart';
import 'package:flutter_ecommerce_youtube/src/utils/helper.dart';
import 'package:flutter_ecommerce_youtube/src/utils/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';

class ProductDetailScreen extends StatefulWidget {
  Product product;

  ProductDetailScreen({this.product, Key key}) : super(key: key);
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ScrollController _scrollController;
  double scrollPosition;
  Product product;
  bool _isPageDown = false;
  TextEditingController _questions = new TextEditingController();

  _scrollListener() {
    scrollPosition = _scrollController.position.pixels;
    if (scrollPosition > 350) {
      setState(() {
        _isPageDown = true;
      });
    } else {
      setState(() {
        _isPageDown = false;
      });
    }
    print(scrollPosition);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    product = widget.product ??
        Product(
          productName: "Test",
          isFavourite: false,
          productDescription:
              "jdf siodjf iosdjf osijfsodij fosidjfosid jfosidjfosdijf",
          price: 1250,
          productDetailedDescription:
              "orpiajg ariogjda ofijaofigjaofigjaoisdjfgoi sfjgoisdfjgoisdfjg iodsfjgoisdfjgosdfijgoisdfjgoisdfjg"
              "sdfgojsdfoigjsdfoigjsdofigjsdfoigj"
              "dsfgoijsdfoigjsdiofg"
              "dfgiosjefgoi sj4dfgidfg"
              "dogfijdoifgjdfog"
              "dfigjoifjgoidfjgidjfgoijdfg"
              "dfoigjodifjgoidjfogijdoifgj"
              "dofigjoidfjgodifjgoidfjg",
          rating: 4.0,
          numberOfUsersRated: 120.0,
        );
    super.initState();
  }

  void _updateFavourite() {
    setState(() {
      product.isFavourite = !product.isFavourite;
      print(product.productDescription);
    });
  }

  Widget _upperBar(BuildContext context) {
    if (_isPageDown) {
      return Container(
        height: SizeConfig.blockSizeVertical * 10,
        width: SizeConfig.blockSizeHorizontal * 100,
        color: ColorConstants.gradientOrangeEnd,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 5,
              top: 15,
              child: BackButton(
                color: ColorConstants.white,
              ),
            ),
            Positioned(
              top: 15,
              right: 40,
              child: Container(
                child: IconButton(
                  icon: product.isFavourite
                      ? Icon(
                          Icons.favorite,
                          color: ColorConstants.red,
                        )
                      : Icon(Icons.favorite_border),
                  onPressed: () {
                    _updateFavourite();
                  },
                  color: ColorConstants.white,
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 60,
              child: Container(
                child: Image(
                  image: AssetImage('assets/PX_Audio_Logo.jpg'),
                  height: SizeConfig.blockSizeVertical * 6,
                ),
              ),
            ),
            Positioned(
              top: 15,
              right: 5,
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    //TODO: Update OnClick
                  },
                  color: ColorConstants.white,
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Stack(
        children: <Widget>[
          Positioned(
            left: 5,
            top: 15,
            child: BackButton(
              color: ColorConstants.white,
            ),
          ),
          Positioned(
            top: 15,
            right: 40,
            child: Container(
              child: IconButton(
                icon: product.isFavourite
                    ? Icon(
                        Icons.favorite,
                        color: ColorConstants.red,
                      )
                    : Icon(Icons.favorite_border),
                onPressed: () {
                  _updateFavourite();
                },
                color: ColorConstants.white,
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 5,
            child: Container(
              child: IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  //TODO: Update OnClick
                },
                color: ColorConstants.white,
              ),
            ),
          )
        ],
      );
    }
  }

  Widget _lowerBar(BuildContext context) {
    return Material(
      elevation: Constants.slight_elevation + 1,
      shadowColor: ColorConstants.grey,
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        height: SizeConfig.blockSizeVertical * 15,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        color: ColorConstants.white,
        child: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Rs " +
                      product.price.toString().substring(
                            0,
                            product.price.toString().indexOf('.'),
                          ),
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical * 3.5,
                      fontWeight: FontWeight.w900,
                      color: ColorConstants.brightGreen),
                ),
                Text(
                  "Total Amount",
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical * 2.5,
                      fontWeight: FontWeight.w900,
                      color: ColorConstants.fontGrey),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: SizeConfig.blockSizeVertical * 8,
              width: SizeConfig.blockSizeHorizontal * 30,
              padding: EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: Offset(2, 4),
                        blurRadius: 5,
                        spreadRadius: 2),
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xfffbb448), Color(0xfff7892b)])),
              child: Text(
                "Buy Now",
                style: TextStyle(fontSize: 20, color: ColorConstants.white),
              ),
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal * 4,
            ),
            Container(
              height: SizeConfig.blockSizeVertical * 8,
              width: SizeConfig.blockSizeHorizontal * 30,
              padding: EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                    width: SizeConfig.blockSizeHorizontal * .5,
                    color: ColorConstants.gradientOrangeEnd),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2),
                ],
                color: ColorConstants.white,
              ),
              child: Text(
                "Add to Cart",
                style: TextStyle(
                    fontSize: 20, color: ColorConstants.gradientOrangeEnd),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otherProducts() {
    return EncapsulatedWidget(header: "Related Products", backgroundColor: ColorConstants.skyBlue,);
  }

  Widget _decscriptionBox() {
    return Material(
      elevation: Constants.slight_elevation,
      shadowColor: ColorConstants.grey,
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        padding: Helper.symmetryPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Description",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeVertical * 3,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical,
            ),
            Text(
              product.productDetailedDescription,
              style: TextStyle(
                fontSize: SizeConfig.blockSizeVertical * 2.5,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical,
            ),
          ],
        ),
      ),
    );
  }

  Widget _reviewsAndRatingsButton() {
    return Material(
      elevation: Constants.slight_elevation,
      shadowColor: ColorConstants.grey,
      child: InkWell(
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 100,
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.blockSizeVertical * 3,
              horizontal: SizeConfig.blockSizeHorizontal * 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Customer Reviews",
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeVertical * 3,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),
              RatingBarIndicatorWidget(
                ratingValue: product.rating,
              ),
              Divider(),
              Text(
                product.numberOfUsersRated.toString().substring(
                        0, product.numberOfUsersRated.toString().indexOf('.')) +
                    " customers have rated ",
                style: TextStyle(
                    color: ColorConstants.grey,
                    fontSize: SizeConfig.blockSizeVertical * 3),
              ),
            ],
          ),
        ),
        onTap: () {
          //TODO: Handling the CLick Event of Customer Reviews
          print("Inside Customer Review");
        },
      ),
    );
  }

  Widget _customerQuestionsBox() {
    return Material(
      elevation: Constants.slight_elevation,
      shadowColor: ColorConstants.grey,
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 100,
        padding: Helper.symmetryPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Customer Questions",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeVertical * 3,
                  fontWeight: FontWeight.w500),
            ),

          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        ImageCarouselWidget(
          type: ImageCarouselType.FullScreenImageSlider,
        ),
        Material(
          elevation: Constants.slight_elevation,
          shadowColor: ColorConstants.grey,
          child: Container(
            width: SizeConfig.blockSizeHorizontal * 100,
            padding: Helper.symmetryPadding(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.productName,
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical * 3,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical,
                ),
                Text(
                  product.productDescription,
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeVertical * 2.5,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.fontGrey),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical,
                ),
                RatingsWidget(
                  product: product,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical,
        ),
        _decscriptionBox(),
        SizedBox(
          height: SizeConfig.blockSizeVertical,
        ),
        _reviewsAndRatingsButton(),
        SizedBox(
          height: SizeConfig.blockSizeVertical,
        ),
        _customerQuestionsBox(),
        SizedBox(
          height: SizeConfig.blockSizeVertical,
        ),
        _otherProducts(),
        Material(
          elevation: Constants.slight_elevation,
          child: Container(
            width: SizeConfig.blockSizeHorizontal * 100,
            height: SizeConfig.blockSizeVertical * 15,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: _scrollController,
            child: _body(),
          ),
          _upperBar(context),
          //TODO: Bottom Padding for Buy Now, Add TO Cart and Pricing Details
          Positioned(
            bottom: 0,
            child: _lowerBar(context),
          ),
        ],
      ),
    );
  }
}

//TODO: Customer Review Page. Enter a Customer Review.
//TODO: Features/Specification BOX

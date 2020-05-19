import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/data/models/product.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/ratings_widget.dart';
import 'package:flutter_ecommerce_youtube/src/utils/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';

class ProductCardWidget extends StatefulWidget {
  double height;
  double width;
  Product product;

  ProductCardWidget({this.height, this.width, this.product, Key key})
      : super(key: key);

  @override
  _ProductCardWidgetState createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  Product product;
  Product productTemp = new Product(
      productId: "1",
      productName: "Test",
      productDescription: "Testing 2",
      imageUrl:
          "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
      price: 2000,
      rating: 4.0);
  double height;
  double width;
  @override
  void initState() {
    product = widget.product;
    height = widget.height;
    width = widget.width;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // Null checks and default value placements.
    height = height ?? SizeConfig.blockSizeVertical * 25;
    width = width ?? SizeConfig.blockSizeHorizontal * 40;
    product = product ?? productTemp;

    return Row(
      children: <Widget>[
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: ColorConstants.white,
          ),
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: height / 2,
                    width: width,
                    child: Image(
                      image: NetworkImage(product.imageUrl),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      product.productName,
                      style: TextStyle(
                          fontSize: height / 10, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    child: Text(
                      product.productDescription,
                      style: TextStyle(
                          fontSize: height / 12, color: ColorConstants.grey),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                        child: Text(
                          "Rs " +
                              product.price.toString().substring(
                                  0, product.price.toString().indexOf('.')),
                          style: TextStyle(
                              fontSize: height / 10,
                              fontWeight: FontWeight.w700,
                              color: ColorConstants.gradientOrangeEnd),
                        ),
                      ),
                      //Text("dsfjjsdf")
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                        child: RatingsWidget(product: product,),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 0.0,
                top: 0.0,
                child: IconButton(
                  icon: product.isFavourite
                      ? Icon(Icons.favorite, color: ColorConstants.red,)
                      : Icon(Icons.favorite_border, color: ColorConstants.white,),

                  onPressed: () {
                    setState(() {
                      product.isFavourite = !product.isFavourite;
                    });
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal * 2,
        ),
      ],
    );
  }
}

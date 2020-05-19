import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/data/models/product.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/product_card.dart';
import 'package:flutter_ecommerce_youtube/src/utils/helper.dart';
import 'package:flutter_ecommerce_youtube/src/utils/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';
import 'dart:developer' as developer;

class EncapsulatedWidget extends StatefulWidget {
  String header;
  double height;
  double width;
  Axis axis;
  Color backgroundColor;
  List<Product> productList;

  EncapsulatedWidget(
      {@required this.header,
      this.height,
      this.width,
      this.axis,
      this.backgroundColor,
      this.productList,
      Key key})
      : super(key: key);

  @override
  _EncapsulatedWidgetState createState() => _EncapsulatedWidgetState();
}

class _EncapsulatedWidgetState extends State<EncapsulatedWidget> {
  String header;
  double height;
  double width;
  Axis axis;
  Color backgroundColor;
  List<Product> productList;
  List<Product> productListTemp;
  Product productTemp;

  @override
  void initState() {
    header = widget.header;
    height = widget.height;
    width = widget.width;
    axis = widget.axis;
    backgroundColor = widget.backgroundColor;
    productList = widget.productList;
    //TODO: Get the List of Products from the DB or Statically build them here.
    productTemp = new Product(
        productId: "1",
        productName: "Test",
        productDescription: "Testing 2",
        imageUrl:
            "https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80",
        price: 2000,
        rating: 4.0);
    productListTemp = List.generate(5, (index) => productTemp);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<ProductCardWidget> productCardWidgetList;

    height = height ?? SizeConfig.blockSizeVertical * 40;
    width = width ?? SizeConfig.blockSizeHorizontal * 60;
    axis = axis ?? Axis.horizontal;
    backgroundColor = backgroundColor ?? Colors.transparent;
    productList = productList ?? productListTemp;

    productCardWidgetList = Helper.convertProductListToProductCardList(
        productList: productList,
        height: height - (SizeConfig.blockSizeHorizontal * 15),
        width: width);

    return Material(
      elevation: 2,
      shadowColor: ColorConstants.grey,
      child: Container(
        height: height,
        color: backgroundColor,
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.blockSizeVertical,
            horizontal: SizeConfig.blockSizeHorizontal * 2),
        child: Column(
          children: <Widget>[
            Helper.backgroundText(text: header),
            Flexible(
              child: ListView(
                scrollDirection: axis,
                children: productCardWidgetList,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

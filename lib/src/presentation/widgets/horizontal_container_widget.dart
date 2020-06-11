import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/data/models/product.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/independent/tile_widget.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/product_card.dart';
import 'package:flutter_ecommerce_youtube/src/utils/helper.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/static_info/dummy_data.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';
import 'dart:developer' as developer;
class EncapsulatedWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    height = height ?? SizeConfig.blockSizeVertical * 32;
    width = width ?? SizeConfig.blockSizeHorizontal * 50;
    axis = axis ?? Axis.horizontal;
    backgroundColor = backgroundColor ?? Colors.transparent;
    productList = productList ?? DummyData.getListOfProduct();

    List<ProductCardWidget> productCardWidgetList = Helper.convertProductListToProductCardList(
        productList: productList,
        height: height - (SizeConfig.blockSizeHorizontal * 15),
        width: width);

    return TileWidget(
      backgroundColor: ColorConstants.white,
      onTap: null,
      elevation: 2,
      borderRadius: 0.0,
      child: Container(
        height: height,
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.blockSizeVertical,
            horizontal: SizeConfig.blockSizeHorizontal * 2),
        child: Column(
          children: <Widget>[
            Helper.backgroundText(text: header),
            Flexible(
              child:
              ListView(
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce_youtube/src/data/models/product.dart';
import 'package:flutter_ecommerce_youtube/src/data/models/users/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/product_card.dart';
import 'package:flutter_ecommerce_youtube/src/utils/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';

class Helper {
  /// All Helper Functions
  static dynamic checkNullAndAssignValue(
      {@required dynamic object, @required dynamic nonNullValue}) {
    object = object ?? nonNullValue;
    return object;
  }

  /// ConversionFromOneObjectToAnother
  static List<ProductCardWidget> convertProductListToProductCardList(
      {@required List<Product> productList,
      @required double height,
      @required double width}) {
    List<ProductCardWidget> productCardWidgetList =
        List.generate(productList.length, (index) {
      return convertProductToProductCardWidget(
          productList[index], height, width);
    });
    print(productCardWidgetList);
    return productCardWidgetList;
  }

  static ProductCardWidget convertProductToProductCardWidget(
      Product product, double height, double width) {
    return ProductCardWidget(
      height: height,
      width: width,
      product: product,
    );
  }

  static Users convertFirebaseUsertoUserObject(FirebaseUser _firebaseUser) {
    Users users = new Users(
        photoUrl: _firebaseUser.photoUrl,
        mobileNumber: _firebaseUser.phoneNumber,
        name: _firebaseUser.displayName,
        userId: _firebaseUser.uid,
        emailId: _firebaseUser.email);
    return users;
  }

  /// All Helper Widgets
  static Widget backgroundText({@required String text}) {
    return Container(
      height: SizeConfig.blockSizeVertical * 5,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 20,
            color: ColorConstants.black,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  static EdgeInsetsGeometry symmetryPadding() {
    return EdgeInsets.symmetric(
        vertical: SizeConfig.blockSizeVertical * 1,
        horizontal: SizeConfig.blockSizeHorizontal * 3);
  }

  static Widget dividerWidget() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text(
            'or',
            style: TextStyle(
                color: ColorConstants.grey, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

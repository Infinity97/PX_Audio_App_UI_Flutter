import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/bar_button.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/independent/tile_widget.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';

class CartScreen extends StatelessWidget {
  Widget _cartWidget() {
    return TileWidget(
      borderRadius: 14,
      elevation: 4,
      onTap: null,
      child: Container(
        width: SizeConfig.blockSizeHorizontal * 95,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 15,
                  width: SizeConfig.blockSizeHorizontal * 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Image(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal * 3,
                ),
                Container(
                  child: Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "ndfuvindivndiufnv ",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Price",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: ColorConstants.red),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Increment and Decrement
            SizedBox(
              height: 3,
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: SizeConfig.blockSizeVertical * 6,
                        width: SizeConfig.blockSizeHorizontal * 10,
                        child: RaisedButton(
                          child: Text("-"),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        height: SizeConfig.blockSizeVertical * 6,
                        width: SizeConfig.blockSizeHorizontal * 10,
                        child: RaisedButton(
                          child: Text("+"),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        height: SizeConfig.blockSizeVertical * 6,
                        width: SizeConfig.blockSizeHorizontal * 10,
                        child: RaisedButton(
                          child: Text("+"),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal * 5,
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 6,
                  width: SizeConfig.blockSizeHorizontal * 20,
                  child: RaisedButton(
                    child: Text("Delete"),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal * 2,
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 6,
                  width: SizeConfig.blockSizeHorizontal * 30,
                  child: RaisedButton(
                    child: Text("Save For Later"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // TODO: Adding Other Products
  // TODO: Adding Saved Products
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.gradientOrangeEnd,
        title: Center(
          child: Text("Cart Page"),
        ),
      ),
      body: Container(
          child: Stack(children: <Widget>[
        ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                _cartWidget(),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2,
                )
              ],
            );
          },
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: SizeConfig.blockSizeVertical * 15,
            padding: EdgeInsets.all(5),
            color: ColorConstants.white,
            width: SizeConfig.blockSizeHorizontal * 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total Price",
                        style: TextStyle(
                            color: ColorConstants.brightGreen,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                      Text(
                        "Total Price",
                        style: TextStyle(
                            color: ColorConstants.brightGreen,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                BarButton(
                  title: "Place Order",
                  height: SizeConfig.blockSizeVertical * 8,
                  width: SizeConfig.blockSizeHorizontal * 85,
                  fontSize: 20,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: SizeConfig.blockSizeVertical * 50,
        ),
      ])),
    );
  }
}

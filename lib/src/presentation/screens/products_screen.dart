//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_ecommerce_youtube/src/data/models/product.dart';
//import 'package:flutter_ecommerce_youtube/src/presentation/widgets/horizontal_container_widget.dart';
//import 'package:flutter_ecommerce_youtube/src/utils/config/size_config.dart';
//
//class ProductsScreen extends StatefulWidget {
//  List<Product> productList;
//
//  ProductsScreen({this.productList, Key key}) : super(key: key);
//
//  @override
//  _ProductsScreenState createState() => _ProductsScreenState();
//}
//
//class _ProductsScreenState extends State<ProductsScreen> {
//  List<Product> productList;
//
//  @override
//  void initState() {
//    productList = widget.productList ?? new List();
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    SizeConfig().init(context);
//    return SingleChildScrollView(
//      child: Stack(
//        children: <Widget>[
//          Column(
//            mainAxisAlignment: MainAxisAlignment.start,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              EncapsulatedWidget(header: "Small Channel Amplifier",width: SizeConfig.blockSizeHorizontal*60,),
//              EncapsulatedWidget(header: "Two Way Dual Zone Amplifier",),
//              EncapsulatedWidget(header: "Two Way Amplifier",),
//              EncapsulatedWidget(header: "Driver Units",),
//              EncapsulatedWidget(header: "Speaker Systems",),
//              EncapsulatedWidget(header: "Speaker Columns",),
//            ],
//          ),
//        ],
//      ),
//    );
//  }
//}

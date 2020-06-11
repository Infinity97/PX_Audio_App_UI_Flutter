import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/data/models/product.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/horizontal_container_widget.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/helper.dart';
import 'package:flutter_ecommerce_youtube/src/utils/static_info/dummy_data.dart';

class ProductsScreen extends StatelessWidget {
  List<EncapsulatedWidget> encapsulatedWidgetList;
  ProductsScreen({this.encapsulatedWidgetList, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    encapsulatedWidgetList = DummyData.getListOfEncapsulatedWidgets();
    SizeConfig().init(context);

    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              encapsulatedWidgetList[index],
              SizedBox(height: SizeConfig.blockSizeVertical)
            ],
          );
        });
  }
}

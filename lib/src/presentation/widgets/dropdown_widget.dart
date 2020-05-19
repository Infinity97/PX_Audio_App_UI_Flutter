import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/utils/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';

class DropDownWidget<T> extends StatefulWidget {
  String hintText;
  Color underlineColor;
  T dropdownValue;
  List<DropdownMenuItem<T>> dropDownMenuItemList;
  DropDownWidget(
      {@required this.dropDownMenuItemList,
      @required this.hintText,
      @required this.dropdownValue,
      this.underlineColor,
      Key key})
      : assert(dropDownMenuItemList != null),
        assert(hintText != null),
        super(key: key);

  @override
  _DropDownWidgetState<T> createState() => _DropDownWidgetState<T>();
}

class _DropDownWidgetState<T> extends State<DropDownWidget<T>> {
  T dropdownValue;
  List<DropdownMenuItem<T>> dropDownMenuItemList;

  @override
  void initState() {
    dropdownValue = widget.dropdownValue;
    dropDownMenuItemList = widget.dropDownMenuItemList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal * 80,
      margin:
          EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 0.5, top: 0.0),
      padding: EdgeInsets.only(),
      child: DropdownButton<T>(
        hint: Text(
          "Select the Product For Service Request",
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
        value: dropdownValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: SizeConfig.blockSizeHorizontal * 7,
        elevation: 4,
        isExpanded: true,
        style: TextStyle(color: ColorConstants.gradientOrangeEnd),
        underline: Container(
          height: 2,
          color: widget.underlineColor ?? ColorConstants.gradientOrangeEnd,
        ),
        onChanged: (T newValue) {
          setState(
            () {
              dropdownValue = newValue;
            },
          );
        },
        items: dropDownMenuItemList,
      ),
    );
  }
}

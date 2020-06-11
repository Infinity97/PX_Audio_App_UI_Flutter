import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/data/models/product.dart';
import 'package:flutter_ecommerce_youtube/src/utils/helper.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';

import 'dart:developer' as developer;
//import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';

//TODO: Put Assert on every Class Widget.
class ServiceScreen extends StatefulWidget {
  String imageUrl;
  List<Product> listOfProducts;
  TabController tabController;
  ServiceScreen(
      {this.imageUrl,
      this.listOfProducts,
      @required this.tabController,
      Key key})
      : super(key: key);
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  String imageUrl;
  List<Product> listOfProducts;
  Product dropdownValue;
  String _dropDownValue;
  bool selectedDropDownValue = false;
  List<DropdownMenuItem> dropDownMenuItemList;
  String barcodeValue = "Barcode Value";
  TextEditingController _serviceRequestRemarksController = new TextEditingController();
  TextEditingController _registerProductIdController = new TextEditingController();
  TextEditingController _registerDateOfPurchaseController = new TextEditingController();
  TextEditingController _registerScanCodeController = new TextEditingController();

  @override
  void initState() {
    imageUrl = widget.imageUrl ??
        "https://www.biography.com/.image/t_share/MTE5NDg0MDU0OTM2NTg1NzQz/tom-cruise-9262645-1-402.jpg";
    listOfProducts = widget.listOfProducts ??
        [
          Product(
              productName: "PX-256 250Watt Public Address System",
              productId: "PX2560010012"),
          Product(productName: "PX-256", productId: "ID2"),
          Product(productName: "PX-256", productId: "ID23"),
          Product(productName: "PX-256", productId: "ID4"),
          Product(productName: "PX-256", productId: "ID5"),
          Product(productName: "PX-256", productId: "ID6"),
          Product(productName: "PX-256", productId: "ID7"),
          Product(productName: "PX-256", productId: "ID8"),
          Product(productName: "PX-256", productId: "ID9"),
          Product(productName: "PX-256", productId: "ID10"),
          Product(productName: "PX-256", productId: "ID11"),
          Product(productName: "PX-256", productId: "ID12"),
        ];
    dropDownMenuItemList = _createListOfDropDownItems(listOfProducts);
    super.initState();
  }

  List<DropdownMenuItem> _createListOfDropDownItems(
      List<Product> listOfProducts) {
    return listOfProducts.map(
      (Product product) {
        return DropdownMenuItem<Product>(
          value: product,
          child: Container(
            child: Column(
              children: <Widget>[
                Text(
                  product.productName,
                  style: TextStyle(color: ColorConstants.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Barcode Number:- ",
                      style: TextStyle(color: ColorConstants.black),
                    ),
                    Text(
                      product.productId,
                      style: TextStyle(
                          color: ColorConstants.black,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Divider(
                  color: ColorConstants.grey,
                ),
              ],
            ),
          ),
        );
      },
    ).toList();
  }

  Widget _submitButton(
    String text,
    Function onClickFunction,
  ) {
    return Material(
      child: InkWell(
        onTap: onClickFunction,
        child: Container(
          width: SizeConfig.blockSizeHorizontal * 80,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
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
            text,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _noProductRegistered() {
    return Container(
      padding: Helper.symmetryPadding(),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: <Widget>[
          Text(
            "Can't Find Your Registered Product? ",
            style: TextStyle(),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(
              "Click ",
              style: TextStyle(),
            ),
            InkWell(
              child: Text(
                "here",
                style: TextStyle(color: ColorConstants.skyBlue),
              ),
              onTap: () {},
            ),
            Text(
              " or Swipe left",
              style: TextStyle(),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _dateOfPurchase(){
    return Container(
      width: SizeConfig.blockSizeHorizontal * 80,
      child: TextField(
        readOnly: true,
        controller: _registerDateOfPurchaseController,
        decoration: InputDecoration(
          suffixIcon: IconButton(icon: Icon(Icons.date_range),onPressed: (){
            DateTime _selectedDate = DateTime.now();


     developer.log("sdhfsdfhsdfj");


     Navigator.push(
                context, MaterialPageRoute(builder: (context) => Scaffold(body: Container(
     margin: EdgeInsets.symmetric(horizontal: 16.0),
       child: CalendarCarousel<Event>(
         headerTextStyle: TextStyle(
             color: ColorConstants.gradientOrangeEnd,
             fontWeight: FontWeight.w900,
             fontSize: SizeConfig.blockSizeVertical * 5),
         iconColor: ColorConstants.gradientOrangeEnd,
         minSelectedDate: DateTime(DateTime.now().year - 2),
         maxSelectedDate: DateTime(DateTime.now().year + 2),
         onDayPressed: (DateTime date, List<Event> events) {
           this.setState(() => _selectedDate = date);
           _registerDateOfPurchaseController = new TextEditingController();
           _registerDateOfPurchaseController.text = _selectedDate.toString();
           print(_registerDateOfPurchaseController.text);
         },
         weekendTextStyle: TextStyle(
           color: Colors.red,
         ),
         thisMonthDayBorderColor: Colors.grey,
         weekFormat: false,
         height: 420.0,
         selectedDateTime: _selectedDate,
         daysHaveCircularBorder: true,
       ),
     ))));

          },),
          hintText: "Enter Your Date of Purchase",
          focusColor: ColorConstants.gradientOrangeEnd,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          labelText: "Date Of Purchase",
          labelStyle: TextStyle(
            color: ColorConstants.gradientOrangeEnd,
          ),
          fillColor: Color(0xfff3f3f4),
        ),
      ),
    );
  }

  //TODO: Adding for a Calendar Widget.
  Widget _registerProduct() {
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: NetworkImage(imageUrl),
              height: SizeConfig.blockSizeVertical * 20,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            ),
            Text(
              "REGISTER YOUR PRODUCT",
              style: TextStyle(
                  color: ColorConstants.gradientOrangeEnd,
                  fontSize: SizeConfig.blockSizeHorizontal * 5,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            _dateOfPurchase(),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            Container(
              width: SizeConfig.blockSizeHorizontal * 80,
              child: TextField(
                controller: _registerProductIdController,
                decoration: InputDecoration(
                  hintText: "Enter Your Product ID",
                  focusColor: ColorConstants.gradientOrangeEnd,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  labelText: "Product ID",
                  labelStyle: TextStyle(
                    color: ColorConstants.gradientOrangeEnd,
                  ),
                  fillColor: Color(0xfff3f3f4),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            Helper.dividerWidget(),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            Container(
              width: SizeConfig.blockSizeHorizontal * 80,
              child: TextField(
                controller: _registerScanCodeController,
                readOnly: true,
                decoration: InputDecoration(
                  enabled: true,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.photo_camera),
                    onPressed: () {
                      setState(() {
                        _registerScanCodeController = new TextEditingController();
                        _registerScanCodeController.text = "Clicked On Camera";
                      });
                      developer.log("sodfhisodjf");
                    },
                  ),
                  hintText: "Click the icon to scan code",
                  focusColor: ColorConstants.gradientOrangeEnd,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  labelText: "Scan Code",
                  labelStyle: TextStyle(
                    color: ColorConstants.gradientOrangeEnd,
                  ),
                  fillColor: Color(0xfff3f3f4),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blockSizeVertical*3,),
            _submitButton("Submit", () {}),
          ],
        ),
      ],
    );
  }

//  Future _barCodeScanner() async{
//    try{
//      var barcode = await BarcodeScanner.scan();
//      setState(() {
//        barcodeValue = barcode.rawContent;
//      });
//    }catch(e){}
//  }

  //TODO: Date of Purchase
  Widget _serviceRequestTab() {
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: NetworkImage(imageUrl),
              height: SizeConfig.blockSizeVertical * 20,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            ),
            Text(
              "SERVICE REQUEST",
              style: TextStyle(
                  color: ColorConstants.gradientOrangeEnd,
                  fontSize: SizeConfig.blockSizeHorizontal * 5,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            ),
            Container(
              width: SizeConfig.blockSizeHorizontal * 80,
              margin: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 0.5, top: 0.0),
              padding: EdgeInsets.only(),
              child: DropdownButton<Product>(
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
                  color: ColorConstants.gradientOrangeEnd,
                ),
                onChanged: (Product newValue) {
                  setState(
                    () {
                      dropdownValue = newValue;
                    },
                  );
                },
                items: dropDownMenuItemList,
              ),
            ),
//            DropDownWidget<Product>(
//              dropdownValue: dropdownValue,
//              dropDownMenuItemList: dropDownMenuItemList,
//              hintText: "Select the Product requiring Service",
//            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            Container(
              width: SizeConfig.blockSizeHorizontal * 75,
              height: SizeConfig.blockSizeVertical * 30,
              child: TextField(
                controller: _serviceRequestRemarksController,
                keyboardType: TextInputType.multiline,
                maxLength: 200,
                cursorColor: ColorConstants.gradientOrangeEnd,
                maxLines: 20,
                decoration: InputDecoration(
                  hintText: "Enter Your Remarks",
                  focusColor: ColorConstants.gradientOrangeEnd,
                  hoverColor: ColorConstants.gradientOrangeEnd,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
//                      labelText: "Remarks",
//                      labelStyle: TextStyle(color: ColorConstants.gradientOrangeEnd,),
                  fillColor: Color(0xfff3f3f4),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            //TODO: To handle the functionality of the Submit Button
            _submitButton("Submit", () {
              developer.log("The dropDown Value chosen is :-",
                  error: dropdownValue.productId.toString());
            },),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            _noProductRegistered(),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              color: ColorConstants.gradientOrangeEnd,
              child: TabBar(
                indicatorColor: ColorConstants.white,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      "Register Your Product",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Service Request",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              _registerProduct(),
              _serviceRequestTab(),
            ],
          ),
        ),
      ),
    );
  }
}

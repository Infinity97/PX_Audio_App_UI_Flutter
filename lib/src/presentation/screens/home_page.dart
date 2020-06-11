import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/data/models/users/users.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/app_bar.dart';
import 'package:http/http.dart' as http ;
import 'dart:developer' as developer;
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
//TODO: Once Logged in to not take you back to the log in page.
class HomePage extends StatefulWidget {

  final Users user;
  const HomePage(this.user, {Key key}) : super(key:key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//  int _cIndex = 0;
//  Future<UsersRequest> _usersRequest;
//  bool displayText = false;
//
//  void _incrementTab(index) {
//    setState(() {
//      _cIndex = index;
//    });
//  }
//
//  @override
//  void initState(){
//    super.initState();
//   // _usersRequest = getUserRequests();
//  }
//
//  String createUserUrl = "http://192.168.29.161:8080/users/all";
//  Future<UsersRequest> getUserRequests() async{
//    developer.log("Inside User Requests Function");
//    final response = await http.get(createUserUrl);
//    if(response.statusCode == 200) {
//      developer.log("Status Code received 200");
//      return UsersRequest.fromJson(json.decode(response.body));
//    }
//    else{
//      developer.log('Status Code received was not 200', error: response.statusCode);
//      throw Exception('Unable to hit the API');
//    }
//    //developer.log("The Response is ");
//    //return response;
//  }
//
  @override
  Widget build(BuildContext context) {
//    Widget imageCarousel = new Container(
//        height: 200.0,
//        child: new Carousel(
//          boxFit: BoxFit.cover,
//          images: [
//            Image.network('https://www.biography.com/.image/t_share/MTE5NDg0MDU0OTM2NTg1NzQz/tom-cruise-9262645-1-402.jpg'),
//            Image.network('http://www.coderzheaven.com/wp-content/uploads/2019/04/Carousel.png'),
//            Image.network('https://www.biography.com/.image/t_share/MTE5NDg0MDU0OTM2NTg1NzQz/tom-cruise-9262645-1-402.jpg'),
//            Image.network('http://www.coderzheaven.com/wp-content/uploads/2019/04/Carousel.png'),
//          ],
//          autoplay: false,
//          animationCurve: Curves.fastOutSlowIn,
//          animationDuration: Duration(milliseconds: 2000),
//          overlayShadowColors: Colors.green,
//          overlayShadowSize: 0.1,
//          indicatorBgPadding: 1,
//          dotSize: 5,
//        )
//    );

//    return Scaffold(
//      appBar: AppBarWidget(
//        title: Text('Home Page View'),
//        actionWidgetList: new AppBarWidget().getAppBarWidgetList(true, true),
//      ),
//      drawer:
//      // DrawerWidget(
//      //widgetList: DrawerWidget().getDrawerWidgetList(false,'0','','') as List<Widget>.m,
//      Drawer(
//        child: new ListView(
//          children: <Widget>[
//            UserAccountsDrawerHeader(
//              accountName: Text(widget.user.name),
//              accountEmail: Text(widget.user.emailId),
//              currentAccountPicture: GestureDetector(
//                child: Center(
//                  child: new CircleAvatar(
//                    radius: 30.0,
////                    backgroundImage: NetworkImage('https://www.biography.com/.image/t_share/MTE5NDg0MDU0OTM2NTg1NzQz/tom-cruise-9262645-1-402.jpg'),
//                      backgroundImage: NetworkImage(widget.user.photoUrl),
//                    backgroundColor: Colors.transparent,
//                  ),
//                ),
//              ),
//              decoration: BoxDecoration(
//                color: Colors.blue,
//              ),
//            ),
//            InkWell(
//              onTap: (){
//                developer.log("Pressed on HOME!!!!");
//              },
//              child: ListTile(
//                title: Text('Home'),
//                leading: Icon(Icons.home),
//              ),
//            ),
//            InkWell(
//              onTap: (){},
//              child: ListTile(
//                title: Text('My Account'),
//                leading: Icon(Icons.account_box),
//              ),
//            ),
//            InkWell(
//              onTap: (){},
//              child: ListTile(
//                title: Text('My Orders'),
//                leading: Icon(Icons.shopping_cart),
//              ),
//            ),
//            InkWell(
//              onTap: (){},
//              child: ListTile(
//                title: Text('Categories'),
//                leading: Icon(Icons.dashboard),
//              ),
//            ),
//            InkWell(
//              onTap: (){},
//              child: ListTile(
//                title: Text('Favourites'),
//                leading: Icon(Icons.favorite),
//              ),
//            ),
//            Divider(),
//            InkWell(
//              onTap: (){},
//              child: ListTile(
//                title: Text('Settings'),
//                leading: Icon(Icons.settings),
//              ),
//            ),
//            InkWell(
//              onTap: (){},
//              child: ListTile(
//                title: Text('About'),
//                leading: Icon(Icons.help, color: Colors.blue,),
//              ),
//            ),
//          ],
//        ),
//      ),
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: _cIndex,
//        type: BottomNavigationBarType.fixed,
//        items: [
//          BottomNavigationBarItem(
//              icon: Icon(Icons.home),
//              title: new Text('Home')
//          ),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.ac_unit,color: Colors.blue),
//              title: new Text('dfgjkdfg')
//          ),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.ac_unit,color: Colors.blue),
//              title: new Text('dfgdfg')
//          ),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.access_alarm,color: Colors.blue),
//              title: new Text('ddfgdfgfdgdfgdfg')
//          ),
//        ],
//        selectedItemColor: Colors.red,
//        onTap: (index){
//            _incrementTab(index);
//        },
//      ),
//      body:new ListView(
//          children: <Widget>[imageCarousel, ],
//        ),
//    );
  return Container();
  }
}


////import 'package:carousel_pro/carousel_pro.dart';
////import 'package:flutter/material.dart';
////import 'package:flutter_ecommerce_youtube/src/models/users.dart';
////import 'package:flutter_ecommerce_youtube/src/screens/home_page.dart';
////import 'package:flutter_ecommerce_youtube/src/screens/language.dart';
////import 'package:flutter_ecommerce_youtube/src/screens/login_page.dart';
////import 'package:flutter_ecommerce_youtube/src/screens/login_signup_screen.dart';
////import 'package:flutter_ecommerce_youtube/src/screens/sign_up_page.dart';
////import 'package:flutter_ecommerce_youtube/src/screens/phone_verification_temp.dart';
////import 'package:flutter_ecommerce_youtube/src/screens/signup.dart';
////import 'package:flutter_ecommerce_youtube/src/screens/welcome.dart';
////import 'package:flutter_ecommerce_youtube/src/utils/constants.dart';
////import 'package:flutter_ecommerce_youtube/src/utils/shared_prefs.dart';
////import 'package:flutter_ecommerce_youtube/src/theme/theme.dart';
////import 'package:flutter_ecommerce_youtube/src/widgets/app_bar.dart';
////import 'package:flutter_ecommerce_youtube/src/widgets/drawer.dart';
////import 'package:shared_preferences/shared_preferences.dart';
////import './src/screens/login.dart';
////import 'package:google_fonts/google_fonts.dart';
////
////void main() {
////  runApp(MyApp());
////}
////
////class MyApp extends StatefulWidget {
////  @override
////  _MyAppState createState() => _MyAppState();
////}
////
////class _MyAppState extends State<MyApp> {
////  @override
////  Widget build(BuildContext context) {
////    RouteSettings routeSettings;
////    Users user = new Users();
////    user.emailId = "dkjfgjkdsf";
////    user.name = "fgdfg";
////    user.mobileNumber = "648949840";
////    user.photoUrl = "https://en.wikipedia.org/wiki/Tom_Cruise_filmography#/media/File:Tom_Cruise_in_London,_2015_(cropped).jpg";
////
////    return MaterialApp(
//////       home: LoginSignUpScreen(),
////      home: HomePage(user),
//////      initialRoute: "/PhoneAuth" ,
//////      initialRoute: Constants.WELCOME_PAGE,
//////      initialRoute: SharedPrefs().isSignedUp() ? Constants.WELCOME_PAGE: Constants.HOME_PAGE,
//////      initialRoute: SharedPrefs().isSignedUp() ? Constants.SIGN_UP : Constants.LOGIN_PAGE,
//////      routes: {
//////        Constants.WELCOME_PAGE: (context) => WelcomePage(),
//////        "/PhoneAuth": (context) => MyHomePage(title: "sdfsdf",),
//////        //Constants.HOME_PAGE : (context) => HomePage();
//////        Constants.SIGN_UP: (context) => SignUpWidget(),
//////        Constants.LOGIN_PAGE: (context) => LoginPage(),
//////      },
////      //home: WelcomePage(),
////      theme: AppTheme.lightTheme.copyWith(
////        textTheme: GoogleFonts.muliTextTheme(Theme.of(context).textTheme),
////      ),
////    );
////  }
////}
//
//import 'package:flutter/material.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: WeatherPage(),
//    );
//  }
//}
//
//class WeatherPage extends StatefulWidget {
//  WeatherPage({Key key}) : super(key: key);
//
//  _WeatherPageState createState() => _WeatherPageState();
//}
//
//class _WeatherPageState extends State<WeatherPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Fake Weather App"),
//      ),
//      body: Container(
//        padding: EdgeInsets.symmetric(vertical: 16),
//        alignment: Alignment.center,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            Text(
//              "City Name",
//              style: TextStyle(
//                fontSize: 40,
//                fontWeight: FontWeight.w700,
//              ),
//            ),
//            Text(
//              "35 °C",
//              style: TextStyle(fontSize: 80),
//            ),
//            CityInputField(),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//class CityInputField extends StatefulWidget {
//  const CityInputField({
//    Key key,
//  }) : super(key: key);
//
//  @override
//  _CityInputFieldState createState() => _CityInputFieldState();
//}
//
//class _CityInputFieldState extends State<CityInputField> {
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.symmetric(horizontal: 50),
//      child: TextField(
//        onSubmitted: submitCityName,
//        textInputAction: TextInputAction.search,
//        decoration: InputDecoration(
//          hintText: "Enter a city",
//          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//          suffixIcon: Icon(Icons.search),
//        ),
//      ),
//    );
//  }
//
//  void submitCityName(String cityName) {
//    // We will use the city name to search for the fake forecast
//  }
//}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_youtube/src/data/repository/impl/notifications_repository_impl.dart';
import 'package:flutter_ecommerce_youtube/src/data/repository/notifications_repository.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/cart/cart_screen.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/login/login_bloc/bloc.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/login/login_signup_screen.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/main/main_screen.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/notification/notification_bloc/bloc.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/notification/notification_screen.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/routes/routes.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/simple_bloc_delegate.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
// void main() => runApp(CarouselDemo());

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    BlocProvider(
      create: (context) {
        return LoginBloc();
      },
      child: CarouselDemo(),
    ),
  );
}

class CarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: ColorConstants.gradientOrangeEnd, backgroundColor: ColorConstants.grey),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutePath.MAIN_SCREEN,
//        initialRoute: '/home',
        routes: {
          RoutePath.LOGIN: (context) => LoginSignUpScreen(),
          RoutePath.MAIN_SCREEN: (context) => MainScreen(),
          RoutePath.NOTIFICATION_SCREEN: (context) => NotificationScreen(),
          RoutePath.CART_SCREEN: (context) => CartScreen(),
          '/home': (ctx) => CarouselDemoHome(),
          '/basic': (ctx) => BasicDemo(),
          '/image': (ctx) => ImageSliderDemo(),
          '/complicated': (ctx) => CompilcatedImageDemo(),
          '/manual': (ctx) => ManuallyControlledSlider(),
          '/noloop': (ctx) => NoonLoopingDemo(),
          '/vertical': (ctx) => VerticalSliderDemo(),
          '/fullscreen': (ctx) => FullscreenSliderDemo(),
          '/ondemand': (ctx) => OnDemandCarouselDemo(),
          '/indicator': (ctx) => CarouselWithIndicatorDemo(),
          '/prefetch': (ctx) => PrefetchImageDemo(),
        });
  }
}

class DemoItem extends StatelessWidget {
  final String title;
  final String route;
  DemoItem(this.title, this.route);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class CarouselDemoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel demo'),
      ),
      body: ListView(
        children: <Widget>[
          DemoItem('Basic demo', '/basic'),
          DemoItem('Image carousel slider', '/image'),
          DemoItem('More complicated image slider', '/complicated'),
          DemoItem('Manually controlled slider', '/manual'),
          DemoItem('Noon-looping carousel slider', '/noloop'),
          DemoItem('Vertical carousel slider', '/vertical'),
          DemoItem('Fullscreen carousel slider', '/fullscreen'),
          DemoItem('Carousel with indicator demo', '/indicator'),
          DemoItem('On-demand carousel slider', '/ondemand'),
          DemoItem('Image carousel slider with prefetch demo', '/prefetch'),
          DemoItem('Multiple item in one screen demo', '/multiple'),
        ],
      ),
    );
  }
}

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(title: Text('Basic demo')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(),
        items: list
            .map((item) => Container(
                  child: Center(child: Text(item.toString())),
                  color: Colors.green,
                ))
            .toList(),
      )),
    );
  }
}

class ImageSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image slider demo')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(),
        items: imgList
            .map((item) => Container(
                  child: Center(
                      child:
                          Image.network(item, fit: BoxFit.cover, width: 1000)),
                ))
            .toList(),
      )),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class CompilcatedImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complicated image slider demo')),
      body: Container(
          child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
        ],
      )),
    );
  }
}

class ManuallyControlledSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ManuallyControlledSliderState();
  }
}

class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manually controlled slider')),
      body: Column(
        children: <Widget>[
          CarouselSlider(
            items: imageSliders,
            options:
                CarouselOptions(enlargeCenterPage: true, aspectRatio: 16 / 9),
            carouselController: _controller,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: RaisedButton(
                  onPressed: () => _controller.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear),
                  child: Text('←'),
                ),
              ),
              Flexible(
                child: RaisedButton(
                  onPressed: () => _controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear),
                  child: Text('→'),
                ),
              ),
              ...Iterable<int>.generate(imgList.length).map(
                (int pageIndex) => Flexible(
                  child: RaisedButton(
                    onPressed: () => _controller.animateToPage(pageIndex,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear),
                    child: Text("$pageIndex"),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NoonLoopingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Noon-looping carousel demo')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 5,
        ),
        items: imageSliders,
      )),
    );
  }
}

class VerticalSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vertical sliding carousel demo')),
      body: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.vertical,
          autoPlay: true,
        ),
        items: imageSliders,
      )),
    );
  }
}

class FullscreenSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fullscreen sliding carousel demo')),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: imgList
                .map((item) => Container(
                      child: Center(
                          child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        height: height,
                      )),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}

class OnDemandCarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('On-demand carousel demo')),
      body: Container(
          child: CarouselSlider.builder(
        itemCount: 100,
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          autoPlay: true,
        ),
        itemBuilder: (ctx, index) {
          return Container(
            child: Text(index.toString()),
          );
        },
      )),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carousel with indicator demo')),
      body: Column(
        children: [
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class PrefetchImageDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PrefetchImageDemoState();
  }
}

class _PrefetchImageDemoState extends State<PrefetchImageDemo> {
  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Prefetch image slider demo')),
      body: Container(
          child: CarouselSlider.builder(
        itemCount: images.length,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, index) {
          return Container(
            child: Center(
                child: Image.network(images[index],
                    fit: BoxFit.cover, width: 1000)),
          );
        },
      )),
    );
  }
}

//import 'package:flutter/material.dart';
//
//import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
//    show CalendarCarousel;
//import 'package:flutter_calendar_carousel/classes/event.dart';
//import 'package:flutter_calendar_carousel/classes/event_list.dart';
//import 'package:flutter_ecommerce_youtube/src/theme/color_constants.dart';
//import 'package:intl/intl.dart' show DateFormat;
//
//void main() => runApp(new MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'dooboolab flutter calendar',
//      theme: new ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
//        // counter didn't reset back to zero; the application is not restarted.
//        primarySwatch: Colors.blue,
//      ),
//      home: new MyHomePage(title: 'Flutter Calendar Carousel Example'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => new _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  DateTime _currentDate = DateTime(2020, 4, 5);
//  @override
//  void initState() {
//    /// Add more events to _markedDateMap EventList
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text(widget.title),
//        ),
//        body: SingleChildScrollView(
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: <Widget>[
//              Container(
//                margin: EdgeInsets.symmetric(horizontal: 16.0),
//                child: CalendarCarousel<Event>(
//                  minSelectedDate: DateTime(DateTime.now().year-2),
//                  maxSelectedDate: DateTime(DateTime.now().year+2),
//                  onDayPressed: (DateTime date, List<Event> events) {
//                    this.setState(() => _currentDate = date);
//                    print(_currentDate);
//                  },
//                  weekendTextStyle: TextStyle(
//                    color: Colors.red,
//                  ),
//                  headerTextStyle: TextStyle(color: ColorConstants.gradientOrangeEnd, fontWeight: FontWeight.w900, fontSize: 20),
//                  iconColor: ColorConstants.gradientOrangeEnd,
//                  thisMonthDayBorderColor: Colors.grey,
//                  weekFormat: false,
//                  height: 420.0,
//                  selectedDateTime: _currentDate,
//                  daysHaveCircularBorder: true,
//                ),
//              ),
//            ],
//          ),
//        ),
//      );
//    }
//}

//import 'dart:async';
//import 'dart:io' show Platform;
//
//import 'package:barcode_scan/barcode_scan.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//
//void main() {
//  runApp(_MyApp());
//}
//
//class _MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<_MyApp> {
//  ScanResult scanResult;
//
//  final _flashOnController = TextEditingController(text: "Flash on");
//  final _flashOffController = TextEditingController(text: "Flash off");
//  final _cancelController = TextEditingController(text: "Cancel");
//
//  var _aspectTolerance = 0.00;
//  var _numberOfCameras = 0;
//  var _selectedCamera = -1;
//  var _useAutoFocus = true;
//  var _autoEnableFlash = false;
//
//  static final _possibleFormats = BarcodeFormat.values.toList()
//    ..removeWhere((e) => e == BarcodeFormat.unknown);
//
//  List<BarcodeFormat> selectedFormats = [..._possibleFormats];
//
//  @override
//  // ignore: type_annotate_public_apis
//  initState() {
//    super.initState();
//
//    Future.delayed(Duration.zero, () async {
//      _numberOfCameras = await BarcodeScanner.numberOfCameras;
//      setState(() {});
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    var contentList = <Widget>[
//      if (scanResult != null)
//        Card(
//          child: Column(
//            children: <Widget>[
//              ListTile(
//                title: Text("Result Type"),
//                subtitle: Text(scanResult.type?.toString() ?? ""),
//              ),
//              ListTile(
//                title: Text("Raw Content"),
//                subtitle: Text(scanResult.rawContent ?? ""),
//              ),
//              ListTile(
//                title: Text("Format"),
//                subtitle: Text(scanResult.format?.toString() ?? ""),
//              ),
//              ListTile(
//                title: Text("Format note"),
//                subtitle: Text(scanResult.formatNote ?? ""),
//              ),
//            ],
//          ),
//        ),
//      ListTile(
//        title: Text("Camera selection"),
//        dense: true,
//        enabled: false,
//      ),
//      RadioListTile(
//        onChanged: (v) => setState(() => _selectedCamera = -1),
//        value: -1,
//        title: Text("Default camera"),
//        groupValue: _selectedCamera,
//      ),
//    ];
//
//    for (var i = 0; i < _numberOfCameras; i++) {
//      contentList.add(RadioListTile(
//        onChanged: (v) => setState(() => _selectedCamera = i),
//        value: i,
//        title: Text("Camera ${i + 1}"),
//        groupValue: _selectedCamera,
//      ));
//    }
//
//    contentList.addAll([
//      ListTile(
//        title: Text("Button Texts"),
//        dense: true,
//        enabled: false,
//      ),
//      ListTile(
//        title: TextField(
//          decoration: InputDecoration(
//            hasFloatingPlaceholder: true,
//            labelText: "Flash On",
//          ),
//          controller: _flashOnController,
//        ),
//      ),
//      ListTile(
//        title: TextField(
//          decoration: InputDecoration(
//            hasFloatingPlaceholder: true,
//            labelText: "Flash Off",
//          ),
//          controller: _flashOffController,
//        ),
//      ),
//      ListTile(
//        title: TextField(
//          decoration: InputDecoration(
//            hasFloatingPlaceholder: true,
//            labelText: "Cancel",
//          ),
//          controller: _cancelController,
//        ),
//      ),
//    ]);
//
//    if (Platform.isAndroid) {
//      contentList.addAll([
//        ListTile(
//          title: Text("Android specific options"),
//          dense: true,
//          enabled: false,
//        ),
//        ListTile(
//          title:
//              Text("Aspect tolerance (${_aspectTolerance.toStringAsFixed(2)})"),
//          subtitle: Slider(
//            min: -1.0,
//            max: 1.0,
//            value: _aspectTolerance,
//            onChanged: (value) {
//              setState(() {
//                _aspectTolerance = value;
//              });
//            },
//          ),
//        ),
//        CheckboxListTile(
//          title: Text("Use autofocus"),
//          value: _useAutoFocus,
//          onChanged: (checked) {
//            setState(() {
//              _useAutoFocus = checked;
//            });
//          },
//        )
//      ]);
//    }
//
//    contentList.addAll([
//      ListTile(
//        title: Text("Other options"),
//        dense: true,
//        enabled: false,
//      ),
//      CheckboxListTile(
//        title: Text("Start with flash"),
//        value: _autoEnableFlash,
//        onChanged: (checked) {
//          setState(() {
//            _autoEnableFlash = checked;
//          });
//        },
//      )
//    ]);
//
//    contentList.addAll([
//      ListTile(
//        title: Text("Barcode formats"),
//        dense: true,
//        enabled: false,
//      ),
//      ListTile(
//        trailing: Checkbox(
//          tristate: true,
//          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//          value: selectedFormats.length == _possibleFormats.length
//              ? true
//              : selectedFormats.length == 0 ? false : null,
//          onChanged: (checked) {
//            setState(() {
//              selectedFormats = [
//                if (checked ?? false) ..._possibleFormats,
//              ];
//            });
//          },
//        ),
//        dense: true,
//        enabled: false,
//        title: Text("Detect barcode formats"),
//        subtitle: Text(
//          'If all are unselected, all possible platform formats will be used',
//        ),
//      ),
//    ]);
//
//    contentList.addAll(_possibleFormats.map(
//      (format) => CheckboxListTile(
//        value: selectedFormats.contains(format),
//        onChanged: (i) {
//          setState(() => selectedFormats.contains(format)
//              ? selectedFormats.remove(format)
//              : selectedFormats.add(format));
//        },
//        title: Text(format.toString()),
//      ),
//    ));
//
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Barcode Scanner Example'),
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.camera),
//              tooltip: "Scan",
//              onPressed: scan,
//            )
//          ],
//        ),
//        body: ListView(
//          scrollDirection: Axis.vertical,
//          shrinkWrap: true,
//          children: contentList,
//        ),
//      ),
//    );
//  }
//
//  Future scan() async {
//    try {
//      var options = ScanOptions(
//        strings: {
//          "cancel": _cancelController.text,
//          "flash_on": _flashOnController.text,
//          "flash_off": _flashOffController.text,
//        },
//        restrictFormat: selectedFormats,
//        useCamera: _selectedCamera,
//        autoEnableFlash: _autoEnableFlash,
//        android: AndroidOptions(
//          aspectTolerance: _aspectTolerance,
//          useAutoFocus: _useAutoFocus,
//        ),
//      );
//
//      var result = await BarcodeScanner.scan(options: options);
//
//      setState(() => scanResult = result);
//    } on PlatformException catch (e) {
//      var result = ScanResult(
//        type: ResultType.Error,
//        format: BarcodeFormat.unknown,
//      );
//
//      if (e.code == BarcodeScanner.cameraAccessDenied) {
//        setState(() {
//          result.rawContent = 'The user did not grant the camera permission!';
//        });
//      } else {
//        result.rawContent = 'Unknown error: $e';
//      }
//      setState(() {
//        scanResult = result;
//      });
//    }
//  }
//}

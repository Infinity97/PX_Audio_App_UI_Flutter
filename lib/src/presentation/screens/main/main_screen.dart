import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_youtube/src/data/repository/impl/UsersRepositoryImpl.dart';
import 'package:flutter_ecommerce_youtube/src/data/repository/impl/notifications_repository_impl.dart';
import 'package:flutter_ecommerce_youtube/src/data/repository/users_repository.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/cart/cart_screen.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/home/home_screen.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/invite/invite_bloc/bloc.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/invite/invite_screen.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/products/products_screen.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/products_screen.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/service_screen.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/drawer.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/search_bar.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/routes/routes.dart';
import 'package:flutter_ecommerce_youtube/src/utils/enums/bottom_navigation_menu_enum.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';
import 'dart:developer' as developer;
import 'package:flutter/widgets.dart';

class MainScreen extends StatefulWidget {
  int numberOfNotification;
  MainScreen({Key key, this.numberOfNotification = 0}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScrollController _scrollController = new ScrollController();
  GlobalKey bottomNavigationKey = GlobalKey();
  int currentPage = 0;
  bool showSearchBar = true;
  TabController _tabController;
  String _appBarTitle = null;
  int _numberOfNotification;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _numberOfNotification = widget.numberOfNotification;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Widget _getPage(int pageNumber) {
      switch (pageNumber) {
        case 0:
          return HomeScreen();
        case 1:
          //        return CartPage();
          return ProductsScreen();
        case 2:
          return BlocProvider(
              create: (context) =>
                  InviteBloc(usersRepository: UsersRepositoryImpl()),
              child: InviteScreen());
        case 3:
          return ServiceScreen(
            tabController: _tabController,
          );
        default:
          return DashboardScreen();
      }
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                FloatingAppBar(
                  showSearchBar: showSearchBar,
                  tabController: _tabController,
                  appBarTitle: _appBarTitle,
                  numberOfNotification: _numberOfNotification,
                ),
              ];
            },
            body: Container(
              child: _getPage(currentPage),
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: BottomNavigationEnum.Home.icon,
            title: BottomNavigationEnum.Home.name,
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationEnum.Products.icon,
            title: BottomNavigationEnum.Products.name,
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationEnum.Invite.icon,
            title: BottomNavigationEnum.Invite.name,
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationEnum.Service.icon,
            title: BottomNavigationEnum.Service.name,
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationEnum.Dashboard.icon,
            title: BottomNavigationEnum.Dashboard.name,
          ),
        ],
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
          if (currentPage == BottomNavigationEnum.Service.index ||
              currentPage == BottomNavigationEnum.Invite.index ||
              currentPage == BottomNavigationEnum.Dashboard.index) {
            setState(() {
              showSearchBar = false;
            });
          } else {
            setState(() {
              showSearchBar = true;
            });
          }
          if (currentPage == BottomNavigationEnum.Home.index) {
            setState(() {
              _appBarTitle = null;
            });
          } else if (currentPage == BottomNavigationEnum.Products.index) {
            setState(() {
              _appBarTitle = "Categories";
            });
          } else if (currentPage == BottomNavigationEnum.Invite.index) {
            setState(() {
              _appBarTitle = "Invite & Earn";
            });
          } else if (currentPage == BottomNavigationEnum.Dashboard.index) {
            setState(() {
              _appBarTitle = "Dashboard";
            });
          } else if (currentPage == BottomNavigationEnum.Service.index) {
            setState(() {
              _appBarTitle = "Help";
            });
          }
        },
        fixedColor: ColorConstants.gradientOrangeEnd,
        unselectedItemColor: ColorConstants.grey,
      ),
    );
  }
}

class FloatingAppBar extends StatelessWidget {
  bool showSearchBar;
  TabController tabController;
  String appBarTitle;
  int numberOfNotification;
  FloatingAppBar(
      {this.numberOfNotification,
      this.showSearchBar,
      this.tabController,
      this.appBarTitle,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Container(
        alignment: Alignment.topLeft,
        child: appBarTitle == null
            ? Center(
                child: Image(
                  image: AssetImage('assets/PX_Audio_Logo.jpg'),
                  width: SizeConfig.blockSizeHorizontal * 30,
                  height: SizeConfig.blockSizeVertical * 6,
                ),
              )
            : Center(
                child: Text(
                  appBarTitle,
                  style: TextStyle(
                      color: ColorConstants.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 21),
                  textAlign: TextAlign.center,
                ),
              ),
      ),
      expandedHeight: showSearchBar
          ? SizeConfig.blockSizeVertical * 15
          : SizeConfig.blockSizeVertical,
      //flexibleSpace: _floatingAppBarContentWidget(),
      actions: <Widget>[
        Container(
            padding: EdgeInsets.fromLTRB(0, 13, 5, 0),
            child: Stack(children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutePath.NOTIFICATION_SCREEN);
                },
                child: Icon(
                  Icons.notifications,
                  size: SizeConfig.blockSizeVertical * 4,
                ),
              ),
              numberOfNotification > 0
                  ? Positioned(
                      right: 0,
                      top: 0,
                      child: new Container(
                        padding: EdgeInsets.all(2),
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '$numberOfNotification',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : new Container()
            ])),
        Container(
          padding: EdgeInsets.fromLTRB(2, 8, 8, 8),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutePath.CART_SCREEN);
            },
            child: Icon(
              Icons.shopping_cart,
              size: SizeConfig.blockSizeVertical * 4,
            ),
          ),
        ),
      ],
      bottom: showSearchBar ? FixedAppBar() : TransparentAppBar(),
      //bottom: FixedAppBar(),
      floating: showSearchBar ? true : false,
      snap: false,
      pinned: showSearchBar ? true : false,
      forceElevated: true,
      backgroundColor: ColorConstants.gradientOrangeEnd,
      elevation: 0,
    );
  }
}

class FixedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical,
          horizontal: SizeConfig.blockSizeHorizontal),
      height: preferredSize.height,
      width: SizeConfig.blockSizeHorizontal * 95,
      color: ColorConstants.gradientOrangeEnd,
      //constraints: BoxConstraints.tight(Size.fromHeight(40)),
      child: Container(
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: ColorConstants.white,
        ),
        child: InkWell(
          onTap: () {
            developer.log("Clicked on the INkwell");
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return SearchScreen();
                },
              ),
            );
          },
          child: Row(
            children: <Widget>[
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 2,
              ),
              Container(
                child: Icon(
                  Icons.search,
                  color: ColorConstants.gradientOrangeEnd,
                  size: 20,
                ),
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 4,
              ),
              Container(
                child: Text(
                  "Search for Products, Categories and More",
                  style: TextStyle(color: ColorConstants.gradientOrangeEnd),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48.0);
}

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0,
      height: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0.0);
}

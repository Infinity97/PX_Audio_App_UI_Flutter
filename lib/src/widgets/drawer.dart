import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('dsf'),
              accountEmail: Text('sdfsdf'),
              currentAccountPicture: GestureDetector(
                child: Center(
                  child: new CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://www.biography.com/.image/t_share/MTE5NDg0MDU0OTM2NTg1NzQz/tom-cruise-9262645-1-402.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.account_box),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_cart),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(Icons.dashboard),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(
                  Icons.help,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//import 'package:flutter/material.dart';
//
//class DrawerWidget extends Drawer {
//   UserAccountsDrawerHeader getDrawerWidgetList({
//    bool isLogin,
//    String username,
//    String emailAddress,
//    String profilePicture,}
//  ) {
//       if(!isLogin){
//         username = 'User';
//         emailAddress = '';
//         profilePicture = 'https://www.biography.com/.image/t_share/MTE5NDg0MDU0OTM2NTg1NzQz/tom-cruise-9262645-1-402.jpg';
//       }
//
//       return new UserAccountsDrawerHeader(
//         accountName: Text(username),
//         accountEmail: Text(emailAddress),
//         currentAccountPicture: GestureDetector(
//           child: new CircleAvatar(
//             radius: 30.0,
//             backgroundImage: NetworkImage(profilePicture),
//             backgroundColor: Colors.transparent,
//           ),
//         ),
//         decoration: BoxDecoration(color: Colors.red),
//       );
//     }
////    username = 'User';
////    emailAddress = '';
////    profilePicture =
////    'https://www.biography.com/.image/t_share/MTE5NDg0MDU0OTM2NTg1NzQz/tom-cruise-9262645-1-402.jpg';
////     List<Widget> drawerWidgetList = [];
////     // if (!isLogin) {
////    //}
////    //UserAccountsDrawerHeader userAccountsDrawerHeader =
////    //drawerWidgetList.add(userAccountsDrawerHeader);
////    return drawerWidgetList;
//
//  DrawerWidget({Key key, List<Widget> widgetList})
//      : super(
//            key: key,
//            child: new ListView(
//              children: widgetList,
//            ));
//}

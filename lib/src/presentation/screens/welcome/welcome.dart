import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/submit_button.dart';
import 'dart:developer' as developer;

// Choose between Business Account or Customer Account
class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}
class _WelcomePageState extends State<WelcomePage> {

  Widget _signUpButton(String text, Function onClick) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      padding: EdgeInsets.fromLTRB(50, 0, 50, 50),
      child: Image(
        image: AssetImage('assets/google_logo.png'),
        height: 100,
      ),
    );
  }

  Widget _skipLogin() {
    return Container(
      child: Column(
        children: <Widget>[
          Wrap(
            children: <Widget>[
              Text("Don't wanna login You can skip by clicking the arrow.", textAlign: TextAlign.center,),
            ],
            direction: Axis.horizontal,
          ),
          Container(
            child: IconButton(
              icon: Icon(Icons.forward, color: Colors.white,size:40 ,),
              onPressed: () {
                developer.log("Clicked Arrow");
              },
            ),
            alignment: Alignment(1.0, 1.0),
          )
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
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
          Text('or'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xfffbb448), Color(0xffe46b10)]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              SizedBox(
                height: 20,
              ),
              SubmitButton(text: "Business", onClickFunction: (){}, ),
              SizedBox(
                height: 20,
              ),
              _signUpButton("Customer", (){}),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

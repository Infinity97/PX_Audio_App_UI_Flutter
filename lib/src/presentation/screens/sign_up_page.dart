import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/customClipper.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'dart:math';
import 'package:flutter/painting.dart';
import 'dart:developer' as developer;

import 'login_page.dart';

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {

  bool showError = false;
  bool obscureText = true;
  TextEditingController _name = new TextEditingController();
  TextEditingController _mobileNumber = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  void dispose(){
    _name.dispose();
    _mobileNumber.dispose();
    _password.dispose();
    super.dispose();
  }

  String validationLogic(String title,
    TextEditingController text,
    bool isDigit,
    bool isPassword,
  ) {
    String textEntered = text.text;
    if(text.text == null || text.text.isEmpty){
      developer.log("Inside Validation logic TEXT = NULL");
      return '$title cannot be empty';
    }
    developer.log("Indise Validation Logic $textEntered ");
    return null;
  }

  Widget _entryFieldBuilder(
      String title, IconData iconData, TextEditingController _text,
      {bool isPassword = false, bool isDigit = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: _text,
            onChanged : (_text){
              setState(() {
                showError = true;
              });
            },
            obscureText: isPassword ? obscureText : isPassword,
            keyboardType: isDigit ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              labelText: title,
              errorText: showError
                  ? validationLogic(title,_text, isDigit, isPassword)
//                    ?  "cannot be empty"
                  : null,
              hintText: "Enter Your $title",
              prefixIcon: Icon(iconData),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              fillColor: Color(0xfff3f3f4), //
              filled: true,
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            obscureText = !obscureText;
                          },
                        );
                      },
                    )
                  : Container(
                      width: 0,
                      height: 0,
                    ),
            ),
          )
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        developer.log("Clicked Register");},
      child: Material(child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
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
          'Create An Account',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
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

  Widget _title() {
    return Row(
      children: <Widget>[
        Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Image(
            image: AssetImage('assets/PX_Audio_Logo.jpg'),
            height: 40,
          ),
        ),
      ],
    );
  }

  Widget _entryFieldWidget() {
    return Column(
      children: <Widget>[
        _entryFieldBuilder("Name", Icons.account_box, _name),
        _entryFieldBuilder("Mobile Number", Icons.contacts, _mobileNumber,
            isDigit: true),
        _entryFieldBuilder("Password", Icons.security, _password,
            isPassword: true),
      ],
    );
  }

  Widget BezierContainer() {
    return Container(
        child: Transform.rotate(
      angle: -pi / 4,
      child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: MediaQuery.of(context).size.height * .4,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfffbb448), Color(0xffe46b10)])),
        ),
      ),
    ));
  }

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -MediaQuery.of(context).size.height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _entryFieldWidget(),
                    SizedBox(
                      height: 50,
                    ),
                    _submitButton(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _createAccountLabel(),
              ),
//              Positioned(
//                  top: -MediaQuery.of(context).size.height * .15,
//                  right: -MediaQuery.of(context).size.width * .4,
//                  child: BezierContainer())
            ],
          ),
        ),
      ),
    );
  }
}

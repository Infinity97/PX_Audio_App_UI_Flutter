import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/sign_up_page.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/widgets/customClipper.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/painting.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

// LOGIN PAGE
class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;

  Widget _entryFieldBuilder(String title,
      {bool isPassword = false, bool isDigit = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            obscureText: isPassword ? obscureText : isPassword,
            keyboardType: isDigit ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              labelText: title,
              hintText: "Enter Your $title",
              border: InputBorder.none,
              fillColor: Color(0xfff3f3f4),
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
    return Container(
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
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 20, color: Colors.white),
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

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpWidget()));
            },
            child: Text(
              'Register',
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
        _entryFieldBuilder("Mobile Number", isDigit: true),
        _entryFieldBuilder("Password", isPassword: true),
      ],
    );
  }

  Widget BezierContainer(){
    return Container(
        child: Transform.rotate(
          angle: -pi /4,
          child: ClipPath(
            clipper: ClipPainter(),
            child: Container(
              height: MediaQuery.of(context).size.height*.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xfffbb448),Color(0xffe46b10)]
                  )
              ),
            ),
          ),
        )
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
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      alignment: Alignment.centerRight,
                      child: Text('Forgot Password ?',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500, color: ColorConstants.darkBlue),),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    _divider(),
                    SignInButton(Buttons.GoogleDark, onPressed: (){}, ),
                    SignInButton(Buttons.Facebook,onPressed: (){},),
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

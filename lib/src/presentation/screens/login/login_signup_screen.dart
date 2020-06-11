import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_youtube/src/presentation/screens/main/main_screen.dart';
import 'package:flutter_ecommerce_youtube/src/utils/helper.dart';
import 'package:flutter_ecommerce_youtube/src/utils/sign_in_service.dart';
import 'package:flutter_ecommerce_youtube/src/utils/config/size_config.dart';
import 'package:flutter_ecommerce_youtube/src/utils/theme/color_constants.dart';
import 'dart:developer' as developer;
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../home_page.dart';

class LoginSignUpScreen extends StatefulWidget {
  @override
  LoginSignUpScreenState createState() => LoginSignUpScreenState();
}

class LoginSignUpScreenState extends State<LoginSignUpScreen> {
  bool showError = false;
  bool obscureText = true;
  bool showOtpScreen = false;
  bool _isButtonDisabled = true;
  TextEditingController _mobileNumber = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _otpController = new TextEditingController();

  void updateIsButtonDisbaled(bool value){
    setState(() {
      this._isButtonDisabled = value;
    });
  }

  FirebaseUser _firebaseUser;
  String _status;
  int _code;

  AuthCredential _phoneAuthCredential;
  String _verificationId;

  @override
  void dispose() {
    _mobileNumber.dispose();
    _password.dispose();
    super.dispose();
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Image(
            image: AssetImage('assets/PX_Audio_Logo.jpg'),
            height: SizeConfig.blockSizeVertical * 5,
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              developer.log("Pressed Skip");
            },
            child: Text(
              "SKIP",
              style: TextStyle(
                  color: ColorConstants.black,
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.safeBlockHorizontal * 5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _imageCarousel() {
    //TODO: Adding the right images in the carousel.
    return new Container(
      height: SizeConfig.blockSizeVertical * 20,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          Image.network(
              'https://www.biography.com/.image/t_share/MTE5NDg0MDU0OTM2NTg1NzQz/tom-cruise-9262645-1-402.jpg'),
          Image.network(
              'http://www.coderzheaven.com/wp-content/uploads/2019/04/Carousel.png'),
          Image.network(
              'https://www.biography.com/.image/t_share/MTE5NDg0MDU0OTM2NTg1NzQz/tom-cruise-9262645-1-402.jpg'),
          Image.network(
              'http://www.coderzheaven.com/wp-content/uploads/2019/04/Carousel.png'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        overlayShadowColors: Colors.green,
        overlayShadowSize: 0.1,
        showIndicator: false,
        borderRadius: false,
      ),
    );
  }

  Widget _submitButton(
    String text,
    Function onClickFunction,
  ) {
    return Material(
      child: InkWell(
        onTap: _isButtonDisabled
            ? (){Fluttertoast.showToast(msg: "Button is Disabled");}
            : () {
                developer.log("Clicked Submit"); // Go to Phone/OTP Verification
                // _submitPhoneNumber();
                onClickFunction();
                setState(() {
                  showOtpScreen = !showOtpScreen;
                });
                showOtpScreen
                    ? _otpScreen(context)
                    // ignore: unnecessary_statements
                    : () {
                        developer.log(
                            "On Pressing Submit Button for OTP Dialog box.");
                      };
              },
        child: Container(
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
              gradient: _isButtonDisabled
                  ? LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [ColorConstants.grey, ColorConstants.grey])
                  : LinearGradient(
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

  String validationLogic(
    String title,
    TextEditingController text,
    bool isDigit,
    bool isPassword,
  ) {
    // TODO: Optimize the Validation Function
    String textEntered = text.text;
    if (text.text == null || text.text.isEmpty) {
      developer.log("Inside Validation logic TEXT = NULL");
      updateIsButtonDisbaled(true);
      print("$_isButtonDisabled");
      return '$title cannot be empty';
    }
    developer.log("Indise Validation Logic $textEntered ");
    updateIsButtonDisbaled(false);
    print("$_isButtonDisabled");
    return null;
  }

  Widget _entryFieldBuilder(
      String title, IconData iconData, TextEditingController _text,
      {bool isPassword = false, bool isDigit = false}) {
    return Container(
      //TODO: Allow Multiple Countries Extension in Mobile Number Text Field.
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      height: SizeConfig.blockSizeVertical * 12,
      child: TextField(
        controller: _text,
        onChanged: (_text) {
          setState(() {
            showError = true;
          });
        },
        obscureText: isPassword ? obscureText : isPassword,
        keyboardType: isDigit ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          helperText: "",
          labelStyle: TextStyle(fontSize: 14),
          hintStyle: TextStyle(fontSize: 14),
          contentPadding: EdgeInsets.all(0),
          labelText: title,
          errorText: showError
              ? validationLogic(title, _text, isDigit, isPassword)
//                    ?  "cannot be empty"
              : null,
          hintText: "Enter Your $title",
          prefixIcon: Icon(
            iconData,
            size: SizeConfig.blockSizeHorizontal * 6,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          fillColor: Color(0xfff3f3f4), //
          filled: true,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(
                      () {
                        obscureText = !obscureText;
                      },
                    );
                  },
                )
              : null,
        ),
      ),
    );
  }

  Widget  _loginSignUpBox() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical * 2,
          horizontal: SizeConfig.blockSizeHorizontal * 3),
      height: SizeConfig.blockSizeVertical * 65,
      width: SizeConfig.blockSizeHorizontal * 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(2, 4),
              blurRadius: 5,
              spreadRadius: 2),
        ],
        color: ColorConstants.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "Login/Signup Using",
            style: TextStyle(
                color: ColorConstants.grey, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: SizeConfig.blockSizeHorizontal * 40,
                height: SizeConfig.blockSizeVertical * 7,
                child: SignInButton(
                  Buttons.GoogleDark,
                  onPressed: () async {
                    _firebaseUser = await SignInService().signInWithGoogle();
                    print("The Firebase User is :- ${_firebaseUser.phoneNumber} ${_firebaseUser.displayName}", );
                    // TODO: Check if Mobile is availble. If available then Call backend with Another API.
                    Navigator.of(context).push(

                      MaterialPageRoute(
                        builder: (context) {
                          return MainScreen();
                         //    return HomePage(Helper.convertFirebaseUsertoUserObject(_firebaseUser));
                        },
                      ),
                    );
                  },
                  text: "Google",
                ),
                alignment: Alignment.topLeft,
              ),
              Container(
                width: SizeConfig.blockSizeHorizontal * 40,
                height: SizeConfig.blockSizeVertical * 7,
                child: SignInButton(
                  Buttons.Facebook,
                  onPressed: () {
                    //TODO: Calling the Facebook Sign In Function
                  },
                  text: "Facebook",
                ),
                alignment: Alignment.topRight,
              ),
            ],
          ),
          Helper.dividerWidget(),
          Text(
            "Use Mobile Number to SignUp/Login",
            style: TextStyle(
                color: ColorConstants.grey, fontWeight: FontWeight.bold),
          ),
//            EntryFieldWidget("Mobile Number", _mobileNumber, Icons.phone, isDigit: true,),
  //          EntryFieldWidget("Password",_password,Icons.lock,isPassword: true,),
          _entryFieldBuilder("Mobile Number", Icons.phone, _mobileNumber,isDigit: true),
          _entryFieldBuilder("Password", Icons.lock, _password, isPassword: true),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0),
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                developer.log("Clicked on Forgot Password");
                // TODO: Opening a Dialog Box for Forgot Password Functionality.
              },
              child: Text(
                'Forgot Password ?',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.darkBlue),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          _submitButton(
            "Submit",
            _submitPhoneNumber,
          ),
        ],
      ),
    );
  }

  /// Functions allowing OTP Verification
  Future<void> _login() async {
    /// This method is used to login the user
    /// `AuthCredential`(`_phoneAuthCredential`) is needed for the signIn method
    /// After the signIn method from `AuthResult` we can get `FirebaserUser`(`_firebaseUser`)
    try {
      developer.log("Inside Login Method");
      await FirebaseAuth.instance
          .signInWithCredential(this._phoneAuthCredential)
          .then((AuthResult authRes) {
        _firebaseUser = authRes.user;
        print(_firebaseUser.toString());
      });
      setState(() {
        _status += 'Signed In\n';
      });
    } catch (e) {
      setState(() {
        _status += e.toString() + '\n';
      });
      print(e.toString());
    }
  }

  void _submitOTP() {
    /// get the `smsCode` from the user
    String smsCode = _otpController.text.toString().trim();
    developer.log("Inside Submit_OTP {} ", error: smsCode);
    developer.log("Verificiation ID: - ", error: this._verificationId);

    /// when used different phoneNumber other than the current (running) device
    /// we need to use OTP to get `phoneAuthCredential` which is in turn used to signIn/login
    this._phoneAuthCredential = PhoneAuthProvider.getCredential(
        verificationId: this._verificationId, smsCode: smsCode);
    developer.log("The Phone Auth Credential ",
        error: this._phoneAuthCredential);
    _login();
  }

  Future<void> _submitPhoneNumber() async {
    /// NOTE: Either append your phone number country code or add in the code itself
    /// Since I'm in India we use "+91 " as prefix `phoneNumber`
    String phoneNumber = "+91 " + _mobileNumber.text.toString().trim();
    print(phoneNumber);

    /// The below functions are the callbacks, separated so as to make code more redable
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');
      setState(
        () {
          _status += 'verificationCompleted\n';
        },
      );
      this._phoneAuthCredential = phoneAuthCredential;
      print(phoneAuthCredential);
    }

    void verificationFailed(AuthException error) {
      print('verificationFailed');
      setState(() {
        _status += '$error\n';
      });
      print(error);
    }

    void codeSent(String verificationId, [int code]) {
      print('codeSent');
      this._verificationId = verificationId;
      print(verificationId);
      this._code = code;
      print(code.toString());
      setState(() {
        _status += 'Code Sent\n';
      });
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
      setState(() {
        _status += 'codeAutoRetrievalTimeout\n';
      });
      print(verificationId);
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: phoneNumber,

      /// `seconds` didn't work. The underlying implementation code only reads in `millisenconds`
      timeout: Duration(milliseconds: 10000),

      /// If the SIM (with phoneNumber) is in the current device this function is called.
      /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
      verificationCompleted: verificationCompleted,

      /// Called when the verification is failed
      verificationFailed: verificationFailed,

      /// This is called after the OTP is sent. Gives a `verificationId` and `code`
      codeSent: codeSent,

      /// After automatic code retreival `timeout` this function is called
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    ); // All the callbacks are above
  }

  _otpScreen(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Enter the OTP",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            content: Container(
              height: SizeConfig.blockSizeVertical * 40,
              width: SizeConfig.blockSizeHorizontal * 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
//                  EntryFieldWidget("OTP",_otpController,Icons.sms),
                  _entryFieldBuilder("OTP", Icons.sms, _otpController),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 5,
                  ),
                  _submitButton("Submit OTP", _submitOTP),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(
        context); // Initialize the entire size of the Application by dividing things into blocks.
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 4,
              vertical: SizeConfig.blockSizeVertical),
          height: SizeConfig.blockSizeVertical * 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2),
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorConstants.gradientOrangeStart,
                  ColorConstants.gradientOrangeEnd
                ]),
          ),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _title(),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  _imageCarousel(),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  _loginSignUpBox(),
                ],
              ),
              // showOtpScreen ? _otpScreen(context): Container(width: 0, height: 0,),
            ],
          ),
        ),
      ),
    );
  }
}


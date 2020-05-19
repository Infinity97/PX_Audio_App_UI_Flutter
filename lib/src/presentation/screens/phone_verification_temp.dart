import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:flutter_ecommerce_youtube/src/utils/sign_in_service.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  FirebaseUser _firebaseUser;
  String _status;

  AuthCredential _phoneAuthCredential;
  String _verificationId;
  int _code;

  SignInService service = new SignInService();

  @override
  void initState() {
    super.initState();
    _getFirebaseUser();
  }

  Future<void>  _getFirebaseUser() async {
    this._firebaseUser = await FirebaseAuth.instance.currentUser();
    setState(() {
      _status =
      (_firebaseUser == null) ? 'Not Logged In\n' : 'Already LoggedIn\n';
    });
  }

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

  Future<void> _logout() async {
    /// Method to Logout the `FirebaseUser` (`_firebaseUser`)
    try {
      // signout code
      await FirebaseAuth.instance.signOut();
      _firebaseUser = null;
      setState(() {
        _status += 'Signed out\n';
      });
    } catch (e) {
      setState(() {
        _status += e.toString() + '\n';
      });
      print(e.toString());
    }
  }

  Future<void> _submitPhoneNumber() async {
    /// NOTE: Either append your phone number country code or add in the code itself
    /// Since I'm in India we use "+91 " as prefix `phoneNumber`
    String phoneNumber = "+91 " + _phoneNumberController.text.toString().trim();
    print(phoneNumber);

    /// The below functions are the callbacks, separated so as to make code more redable
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');
      setState(() {
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

      /// After automatic code retrival `tmeout` this function is called
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    ); // All the callbacks are above
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
    developer.log("The Phone Auth Credential ", error : this._phoneAuthCredential);
    _login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 24),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: TextField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                flex: 1,
                child: MaterialButton(
               // onPressed: () => service.submitPhoneNumber(_phoneNumberController.text.toString().trim()),
                  onPressed: _submitPhoneNumber,
                  child: Text('Submit'),
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 48),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: TextField(
                  controller: _otpController,
                  decoration: InputDecoration(
                    hintText: 'OTP',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                flex: 1,
                child: MaterialButton(
//                  onPressed: ()=> service.submitOTP(_otpController.text.toString().trim()),
                  onPressed: _submitOTP,
                  child: Text('Submit'),
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 48),
          Text('$_status'),
          SizedBox(height: 48),
          MaterialButton(
            onPressed: _login,
            child: Text('Login'),
            color: Theme.of(context).accentColor,
          ),
          SizedBox(height: 24),
          MaterialButton(
            onPressed: _logout,
            child: Text('Logout'),
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }
}
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce_youtube/src/data/models/usersRequest.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class SignInService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  FirebaseUser _firebaseUser;
  String _status;

  AuthCredential _phoneAuthCredential;
  String _verificationId;
  int _code;

  Future<void> submitPhoneNumber(String phoneNumber) async {
    /// The below functions are the callbacks, separated so as to make code more redable

    developer.log("The Phone Number is :- ");
    print(phoneNumber);

    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');
      this._status += 'verificationCompleted\n';
      this._phoneAuthCredential = phoneAuthCredential;
      print(phoneAuthCredential);
    }

    void verificationFailed(AuthException error) {
      print('verificationFailed');
      this._status += '$error\n';
      print(error);
    }

    void codeSent(String verificationId, [int code]) {
      print('codeSent');
      this._verificationId = verificationId;
      print(verificationId);
      this._code = code;
      print(code.toString());
      this._status += 'Code Sent\n';
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
      this._status += 'codeAutoRetrievalTimeout\n';
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

    //return _phoneAuthCredential;
  }

  void submitOTP(String smsCode) {
    /// get the `smsCode` from the user
    //smsCode = _otpController.text.toString().trim();
    //String _verificationId;
    print(smsCode);

    /// when used different phoneNumber other than the current (running) device
    /// we need to use OTP to get `phoneAuthCredential` which is inturn used to signIn/login
    this._phoneAuthCredential = PhoneAuthProvider.getCredential(
        verificationId: this._verificationId, smsCode: smsCode);

    _login();
  }


  Future<void> _login() async {
    /// This method is used to login the user
    /// `AuthCredential`(`_phoneAuthCredential`) is needed for the signIn method
    /// After the signIn method from `AuthResult` we can get `FirebaserUser`(`_firebaseUser`)
    try {
      await FirebaseAuth.instance
          .signInWithCredential(this._phoneAuthCredential)
          .then((AuthResult authRes) {
        _firebaseUser = authRes.user;
        print(_firebaseUser.toString());
      });
      this._status += 'Signed In\n';
    } catch (e) {
      this._status += e.toString() + '\n';
      print(e.toString());
    }
  }

  Future<void> _logout() async {
    /// Method to Logout the `FirebaseUser` (`_firebaseUser`)
    try {
      // signout code
      await FirebaseAuth.instance.signOut();
      _firebaseUser = null;
      _status += 'Signed out\n';
    } catch (e) {
      _status += e.toString() + '\n';
      print(e.toString());
    }
  }


  Future<FirebaseUser> signInWithGoogle() async {
    SharedPreferences sharedPreferences; // To save information whether first time logged in or not for showing the tutorial.

    bool loading = false;
    bool isLoggedIn = false;

    sharedPreferences = await SharedPreferences.getInstance();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    if (user != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection("users")
          .where("id", isEqualTo: user.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        Firestore.instance.collection("users").document(user.uid).setData(
          {
            "id": user.uid,
            "name": user.displayName,
            "profilePicture": user.photoUrl,
            "email": user.email,
          },
        );
        // Saving details to sharedPreferences Map.
        await sharedPreferences.setString("id", user.uid);
        await sharedPreferences.setString("name", user.displayName);
        await sharedPreferences.setString("photoUrl", user.photoUrl);
      } else {
        await sharedPreferences.setString("id", documents[0]['id']);
        await sharedPreferences.setString("name", documents[0]['name']);
        await sharedPreferences.setString("photoUrl", documents[0]['photoUrl']);
      }
    }

    developer.log(
        "We are inside the logging page and right before the post call",
        name: "INFO");
    //var client = createHttpClient();

//  UsersRequest usersRequest = new UsersRequest(name: user.displayName, emailId: user.email);
//  String createUserUrl = "192.168.29.161:8080/users/add";
//  Future<UsersRequest> userRequestFuture;
//  await http.post(createUserUrl, body: usersRequest).then((http.Response response) {
//
//    final int statusCode = response.statusCode;
//
//    if(statusCode >200 || statusCode < 400 || json == null){
//      throw new Exception ("Error fetching the data");
//    }
//    print("Succes in POST Request !!!!");
//    print(UsersRequest.fromJson(json.decode(response.body)));
//  });
    return user;
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Sign Out");
  }
}
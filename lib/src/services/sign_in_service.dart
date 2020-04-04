import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce_youtube/src/models/usersRequest.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<FirebaseUser> signInWithGoogle() async {
  //  final GoogleSignIn googleSignIn = new GoogleSignIn();
//  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences
      sharedPreferences; // To save information whether first time logged in or not for showing the tutorial.
//
  bool loading = false;
  bool isLoggedIn = false;
//
//  @override
//  void initState() {
//    super.initState(); // Calling the initialState of Login Class
//    isSignedIn();
//  }
//
//  void isSignedIn() async {
//    setState(() {
//      loading = true;
//    });
//
  sharedPreferences = await SharedPreferences.getInstance();
//    isLoggedIn = await googleSignIn.isSignedIn();
//    if (isLoggedIn) {
//      Navigator.pushReplacement(
//          context, MaterialPageRoute(builder: (context) => HomePage()));
//    }
//    setState(() {
//      loading = false;
//    });
//
//    Future handleSignIn() async {
//      sharedPreferences = await SharedPreferences.getInstance();
//
//      setState(() {
//        loading = true;
//      });
//
//      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//      GoogleSignInAuthentication googleSignInAuthentication =
//          await googleSignInAccount.authentication;
//      FirebaseUser firebaseUser = await firebaseAuth.signInWithGoogle(
//          idToken: googleSignInAuthentication.idToken,
//          accessToken: googleSignInAuthentication.accessToken);
//
//
//        Fluttertoast.showToast(msg: "Login Was Succesful");
//        setState(() {
//          loading = false;
//        });
//      } else {}
//    }
//  }

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
      await sharedPreferences.setString("id", user.uid);
      await sharedPreferences.setString("name", user.displayName);
      await sharedPreferences.setString("photoUrl", user.photoUrl);
    } else {
      await sharedPreferences.setString("id", documents[0]['id']);
      await sharedPreferences.setString("name", documents[0]['name']);
      await sharedPreferences.setString("photoUrl", documents[0]['photoUrl']);
    }
  }

  developer.log("We are inside the logging page and right before the post call", name: "INFO");
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

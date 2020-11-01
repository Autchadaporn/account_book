import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savemoney2/pages/homepage.dart';
import 'register.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:async';


// ignore: camel_case_types
class logIn extends StatefulWidget {
  logIn({Key key}) : super(key: key);
  @override
  _logInState createState() => _logInState();
}

// ignore: camel_case_types
class _logInState extends State<logIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0Xffbbd4ce),
              Colors.blue[100],
              Color(0Xfff9b4ab),
            ])),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              pictureIcon(),
              nameApp(),
              mySizebox(),
              usernameForm(),
              mySizebox(),
              passwordForm(),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 90, top: 8),
                      child: register),
                  Container(
                      padding: const EdgeInsets.only(left: 50, top: 8),
                      child: login),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  RaisedButton get register {
    return RaisedButton(
      onPressed: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SignupPage();
        }))
      },
      color: Colors.blue[700],
      //padding: const EdgeInsets.only(left: 10),
      child: Text(
        'Register',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  RaisedButton get login {
    return RaisedButton(
      onPressed: () => {
        signIn(),
      },
      color: Colors.green,
      // padding: const EdgeInsets.only(left: 10),
      child: Text(
        'Login',
        style: TextStyle(color: Colors.white),
      ),
    );
  }


  Widget usernameForm() {
    return Container(
      width: 250.0,
      height: 50.0,
      child: TextField(
        controller: emailController,
        decoration: InputDecoration(
          labelText: "Email",
          labelStyle:
              // TextStyle(fontSize: 14, color: Colors.grey.shade400),
              TextStyle(fontSize: 14, color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              // color: Colors.grey.shade300,
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black,
              )),
        ),
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      width: 250.0,
      height: 50.0,
      child: TextField(
        controller: passwordController,
        decoration: InputDecoration(
          labelText: "Password",
          labelStyle:
              // TextStyle(fontSize: 14, color: Colors.grey.shade400),
              TextStyle(fontSize: 14, color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              // color: Colors.grey.shade300,
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black,
              )),
        ),
      ),
    );
  }

  


mySizebox() => SizedBox(
      width: 8.0,
      height: 20.0,
    );

Widget pictureIcon() {
  return Container(
    width: 150.0,
    height: 150.0,
    child: Image.asset('images/unicorn.png'),
  );
}

Text nameApp() => Text(
      'My Account Book',
      style: TextStyle(fontSize: 28.0,),
      
    );

signIn() {
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((user) {
          Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => homepage()));
      
     // checkAuth(context); // add here
    }).catchError((error) {
      print(error.message);
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(error.message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ));
    });
  }

  // Future checkAuth(BuildContext context) async {
  //   FirebaseUser user = await _auth.currentUser();
  //   if (user != null) {
  //     print("Already singed-in with");
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => MainPage()));
  //   }
  // }
 }

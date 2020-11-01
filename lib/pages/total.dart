import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:savemoney2/pages/login.dart';
// import 'dart:convert';

class total extends StatefulWidget {
  @override
  _totalState createState() => _totalState();
}

class _totalState extends State<total> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Accout',
          style: TextStyle(color: Color(0Xffffffff)),
        ),
        backgroundColor: Color(0Xff4e1b3c),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Color(0Xffffffff),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return logIn();
              }));
//dosomething
            },
          )
        ],
      ),
      body: Container(
        child: Center(
            child: Column(
          children: <Widget>[],
        )),
      ),
    );
  }
}

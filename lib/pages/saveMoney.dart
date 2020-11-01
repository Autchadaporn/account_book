import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savemoney2/pages/statement.dart';
import 'package:flutter/services.dart';

class saveMoney extends StatefulWidget {
  @override
  _saveMoneyState createState() => _saveMoneyState();
}

class _saveMoneyState extends State<saveMoney> {
  String account,bank,promptpay;
  TextEditingController addAccoutController = TextEditingController();
  TextEditingController addBankController = TextEditingController();
  TextEditingController addPromptController = TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Account Book'),
        backgroundColor: Color(0Xff679186),
      ),
      body: Container(
        child: Center(
          child: Column(children: <Widget>[
            mySizebox(),
            // pictureIcon(),
            mySizebox(),
            addAccount(),//เลขบัญชี
            mySizebox(),
            addBank(), //ธนาคาร
            mySizebox(),
            addPromptpay(),//เลขพร้อมเพย์
            add,
          ]),
        ),
      ),
    );
  }

  RaisedButton get add {
    return RaisedButton(
      onPressed: ()=> {
        addAccountBook(),
      },
      color: Colors.green,
      // padding: const EdgeInsets.only(left: 10),
      child: Text(
        'เพิ่ม',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget pictureIcon() {
    return Container(
      width: 150.0,
      height: 150.0,
      child: Image.asset('images/unicorn.png'),
    );
  }

  mySizebox() => SizedBox(
        width: 8.0,
        height: 20.0,
      );


  Widget addAccount() {
    return Container(
      width: 300.0,
      child: TextField(
        onChanged: (value) => account = value.trim(),
        controller: addAccoutController,
        decoration: new InputDecoration(labelText: "เลขบัญชี",
        labelStyle:
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
              ) )),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            
            inputFormatters: <TextInputFormatter>[
    WhitelistingTextInputFormatter.digitsOnly,
],
        // decoration: InputDecoration(
        //   labelText: "เพิ่มจำนวนเงิน",
        //   labelStyle:
        //       // TextStyle(fontSize: 14, color: Colors.grey.shade400),
        //       TextStyle(fontSize: 14, color: Colors.black),
        //   enabledBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10),
        //     borderSide: BorderSide(
        //       // color: Colors.grey.shade300,
        //       color: Colors.black,
        //     ),
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(10),
        //       borderSide: BorderSide(
        //         color: Colors.black,
        //       )),
        // ),
      ),
    );
  }

  Widget addBank() {
    return Container(
      width: 300.0,
      child: TextField(
        onChanged: (value) => bank = value.trim(),
        controller: addBankController,
        
        decoration: InputDecoration(
          labelText: "ธนาคาร",
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
  Widget addPromptpay() {
    return Container(
      width: 300.0,
      child: TextField(
        onChanged: (value) => promptpay = value.trim(),
        controller: addPromptController,
        
        decoration: InputDecoration(
          labelText: "พร้อมเพย์",
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

  void addAccountBook() {
    String saveAccout = addAccoutController.text.trim() ;
    String saveBank = addBankController.text.trim() ;
    String savePrompt = addPromptController.text.trim() ;
    var firebaseUser =  FirebaseAuth.instance.currentUser;
      firestoreInstance.collection(firebaseUser.uid).add(
      {"account":saveAccout,
      "bank":saveBank,
      "prompt":savePrompt},
    ).then((value) {
      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return statement();

                      }));
      print("success");
    });
  }
    
  }


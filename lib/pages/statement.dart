import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:savemoney2/pages/login.dart';

class statement extends StatefulWidget {
  @override
  _statementState createState() => _statementState();
}

class _statementState extends State<statement> {
  final firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Book ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0Xff264e70),
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
      body: StreamBuilder(
        stream: firestoreInstance.collection(firebaseUser.uid).snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              if (!snapshot.hasData) return const Text('Loading..');
              DocumentSnapshot course = snapshot.data.documents[index];
              return ListTile(
                subtitle: Text('เลขบัญชี : '+ course['account']  +'\n'
                + 'ธนาคาร : '+ course['bank'] + '\n'
                + 'พร้อมเพย์ : '+ course['prompt']  ),
                isThreeLine: true,
              );
            },
          );
        },
      ),
    );
  }
  
}

